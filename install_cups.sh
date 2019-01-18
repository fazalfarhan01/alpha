sudo apt-get update
sudo apt-get install cups -y
sudo usermod -a -G lpadmin pi
sudo cp cupsd.conf /etc/cups/cupsd.conf
sudo /etc/init.d/cups restart
