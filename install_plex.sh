sudo apt-get update
sudo apt-get upgrade -y
sudo apt-get install apt-transport-https -y
wget -O - https://dev2day.de/pms/dev2day-pms.gpg.key | sudo apt-key add -
echo "deb https://dev2day.de/pms/ jessie main" | sudo tee /etc/apt/sources.list.d/pms.list
sudo apt-get update
mkdir /home/pi/PLEX
sudo apt-get install -t jessie plexmediaserver -y
#echo "change user from 'plex' to 'pi'"
#sleep 5
#sudo nano /etc/default/plexmediaserver.prev
#
#
sudo rm -r /etc/default/plexmediaserver.prev
echo"# default script for Plex Media Server

# the number of plugins that can run at the same time
PLEX_MEDIA_SERVER_MAX_PLUGIN_PROCS=6

# ulimit -s $PLEX_MEDIA_SERVER_MAX_STACK_SIZE
PLEX_MEDIA_SERVER_MAX_STACK_SIZE=3000

# where the mediaserver should store the transcodes
PLEX_MEDIA_SERVER_TMPDIR=/tmp

# uncomment to set it to something else
# PLEX_MEDIA_SERVER_APPLICATION_SUPPORT_DIR="${HOME}/Library/Application\ Support"

# the user that PMS should run as, defaults to 'plex'
# note that if you change this you might need to move
# the Application Support directory to not lose your
# media library
PLEX_MEDIA_SERVER_USER=pi" | sudo tee /etc/default/plexmediaserver.prev
sudo service plexmediaserver restart
