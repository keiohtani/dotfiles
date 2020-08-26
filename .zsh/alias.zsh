uname=$(uname)

BASE_DIR=$(dirname $0)

for alias_file in $BASE_DIR/alias/**/*; do
    if [ ! -d $alias_file ]; then
        source $alias_file
    fi
done
