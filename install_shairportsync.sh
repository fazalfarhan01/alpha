sudo apt-get update
sudo apt-get upgrade -y
sudo iwconfig wlan0 power off
sudo apt install build-essential git xmltoman autoconf automake libtool libdaemon-dev libpopt-dev libconfig-dev libasound2-dev avahi-daemon libavahi-client-dev libssl-dev
sudo git clone https://github.com/mikebrady/shairport-sync.git
cd shairport-sync
sudo autoreconf -fi
sudo ./configure --sysconfdir=/etc --with-alsa --with-avahi --with-ssl=openssl --with-systemd
sudo make
sudo make install
sudo systemctl enable shairport-sync
sudo systemctl start shairport-sync
