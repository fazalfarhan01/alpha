sudo apt-get update
sudo apt-get install cups -y
sudo usermod -a -G lpadmin pi
sudo nano /etc/cups/cupsd.conf
sudo /etc/init.d/cups restart
