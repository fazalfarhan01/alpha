sudo apt-get update
sudo apt-get install samba samba-common-bin -y
sudo rm -r /etc/samba/smb.conf
echo "[HOME]
comment = HOME
browseable = yes
path = /home/pi
writeable = Yes
create mask = 0777
directory mask = 0777
browseable = Yes
public = yes
" sudo tee /etc/samba/smb.conf
echo "Enter a Password for NAS"
sudo smbpasswd -a pi
sudo /etc/init.d/samba restart
