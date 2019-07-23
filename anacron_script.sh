# Written by Karl Kaiser 07/02/2019
# Last updated by Karl Kaiser 07/02/2019

# Notification
su USER -c '"The Tech Rescue build script is about to be running, please do not shut off this device"'
su USER -c '"This may slow down the device for the next 5-10 minutes"'

# Clone package, add relevant username and password
git clone https://github.com/kwkaiser/TechRescue.git /home/USER/TechRescue

sed -i 's/$USR/NEWU/g' /home/USER/TechRescue/automate_upload.sh
sed -i 's/$PASSWORD/NEWP/g' /home/USER/TechRescue/automate_upload.sh

# Set wifi name and password
sed -i 's/$WIFIUSR/NEW_WIFI_USR/g' /home/USER/TechRescue/ttbuild.sh
sed -i 's/$WIFIPASS/NEW_WIFI_PASS/g' /home/USER/TechRescue/ttbuild.sh

# Notify user and build
sh /home/USER/TechRescue/automate_upload.sh

# Remove remaining files  & cleanup
rm -rf /home/USER/TechRescue/
