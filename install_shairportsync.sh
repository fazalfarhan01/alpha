sudo apt-get update
sudo apt-get upgrade -y
iwconfig wlan0 power off
apt install build-essential git xmltoman autoconf automake libtool libdaemon-dev libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev
git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
autoreconf -fi
./configure --sysconfdir=/etc --with-alsa --with-avahi --with-ssl=openssl --with-systemd
make
sudo make install
systemctl enable shairport-sync
systemctl start shairport-sync
