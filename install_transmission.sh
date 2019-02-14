sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install transmission-daemon -y
sudo systemctl stop transmission-daemon
sudo cp settings.json /etc/transmission-daemon/settings.json
sudo ufw allow 9091,51413/tcp
sudo systemctl start transmission-daemon
