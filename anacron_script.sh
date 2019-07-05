# Written by Karl Kaiser 07/02/2019
# Last updated by Karl Kaiser 07/02/2019

# Notification
kdialog --passivepopup "The Tech Rescue build script is about to be running, please do not shut off this device" 500
kdialog --passivepopup "This may slow down the device for the next 5-10 minutes" 500

# Clone package, add relevant username and password
git clone https://github.com/kwkaiser/TechRescue.git /home/USER/TechRescue

sed -i 's/$USR/$NEWU/g' /home/USER/TechRescue/automate_upload.sh
sed -i 's/$PASSWORD/$NEWP/g' /home/USER/TechRescue/automate_upload.sh

# Notify user and build
notify-send "Beginning to run Tech Rescue build script; this may take up some resources"
sh /home/USER/TechRescue/automate_upload.sh
notify-send "Tech Rescue build finished"

# Remove remaining files  & cleanup
rm -rf /home/USER/TechRescue/
