#!/usr/bin/env bash
set -euo pipefail

# =====================================
# Corporate CA trust bootstrap for macOS (user: kohtani)
# =====================================

CA_COMMON_NAME="${CA_COMMON_NAME:-WBG Root CA G2}"
BUNDLE_DIR="$HOME/.ssl"
BUNDLE_FILE="$BUNDLE_DIR/cacert_corporate_bundle.pem"
ZSH_LOCAL="$HOME/.zshrc_local.zsh"

mkdir -p "$BUNDLE_DIR"

echo "==> Building unified CA bundle at $BUNDLE_FILE"

# --- Step 1: Base public CA bundle (certifi → system → brew fallback) ---
tmp_public="$BUNDLE_DIR/_public_cacert.pem"
if python3 -c 'import certifi' >/dev/null 2>&1; then
  cp "$(python3 -c 'import certifi; print(certifi.where())')" "$tmp_public"
elif [ -f /etc/ssl/cert.pem ]; then
  cp /etc/ssl/cert.pem "$tmp_public"
elif [ -f "$(brew --prefix 2>/dev/null)/etc/openssl@3/cert.pem" ]; then
  cp "$(brew --prefix)/etc/openssl@3/cert.pem" "$tmp_public"
else
  echo "⚠ No base CA bundle found; continuing with empty base."
  : > "$tmp_public"
fi

# --- Step 2: Export corporate roots/intermediates from Keychain ---
corp_chain="$BUNDLE_DIR/_corp_chain.pem"
: > "$corp_chain"

# Export specific root
if security find-certificate -c "$CA_COMMON_NAME" -p >/dev/null 2>&1; then
  echo "Exporting $CA_COMMON_NAME from Keychain..."
  security find-certificate -c "$CA_COMMON_NAME" -p >> "$corp_chain"
fi

# Try catching other 'World Bank Group' certs too
security find-certificate -a -Z -p | \
  awk 'BEGIN{RS="-----END CERTIFICATE-----\n"; ORS="-----END CERTIFICATE-----\n"} 
       /World Bank Group/ {print $0}' >> "$corp_chain" || true

# --- Step 3: Combine & dedupe ---
awk '
  BEGIN { cert="" }
  /-----BEGIN CERTIFICATE-----/ { cert=$0; next }
  /-----END CERTIFICATE-----/   { cert=cert ORS $0; print cert; cert=""; next }
  { cert=cert ORS $0 }
' "$tmp_public" "$corp_chain" 2>/dev/null | \
awk 'BEGIN{RS="-----END CERTIFICATE-----\n"; ORS="-----END CERTIFICATE-----\n"} 
     { if (!($0 in seen)) { print; seen[$0]=1 } }' > "$BUNDLE_FILE"

echo "✔ Combined bundle created."

# --- Step 4: Environment variables (for zsh shells) ---
touch "$ZSH_LOCAL"

add_if_missing() {
  local line="$1" file="$2"
  grep -Fqs "$line" "$file" 2>/dev/null || echo "$line" >> "$file"
}

add_if_missing "export SSL_CERT_FILE=\"$BUNDLE_FILE\"" "$ZSH_LOCAL"
add_if_missing "export REQUESTS_CA_BUNDLE=\"$BUNDLE_FILE\"" "$ZSH_LOCAL"
add_if_missing "export CURL_CA_BUNDLE=\"$BUNDLE_FILE\"" "$ZSH_LOCAL"
add_if_missing "export NODE_EXTRA_CA_CERTS=\"$BUNDLE_FILE\"" "$ZSH_LOCAL"

# --- Step 5: Tool-specific configs ---
# Git
git config --global http.sslCAInfo "$BUNDLE_FILE" || true

# pip / Python
mkdir -p "$HOME/.pip"
cat > "$HOME/.pip/pip.conf" <<EOF
[global]
cert = $BUNDLE_FILE
EOF

# RubyGems
cat > "$HOME/.gemrc" <<EOF
install: --no-document
update:  --no-document
:ssl_ca_cert: $BUNDLE_FILE
EOF

# npm
if command -v npm >/dev/null 2>&1; then
  npm config set cafile "$BUNDLE_FILE" >/dev/null 2>&1 || true
fi

echo "==> Corporate CA bundle configured for user: $(whoami)"
echo "   - Bundle: $BUNDLE_FILE"
echo "   - Zsh env vars in: $ZSH_LOCAL"
echo "   - pip.conf, gemrc, git, npm updated"
echo "✅ Run: source ~/.zshrc_local.zsh or open a new shell"

