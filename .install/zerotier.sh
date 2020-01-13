# install zerotier
# https://iamkelv.in/blog/2017/06/zerotier.html

echo 'Installing zerotier...'
echo 'Enter network ID for zerotier:' 
read networkID 
curl -s 'https://raw.githubusercontent.com/zerotier/download.zerotier.com/master/htdocs/contact%40zerotier.com.gpg' | gpg --import && \
    if z=$(curl -s 'https://install.zerotier.com/' | gpg); then echo "$z" | sudo bash; fi
sudo systemctl enable zerotier-one
sudo zerotier-cli join $networkID
echo 'Authenticate your device at https://my.zerotier.com/network/$networkID'
sudo touch /var/lib/zerotier-one/networks.d/${networkID}.conf