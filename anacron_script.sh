# Written by Karl Kaiser 07/02/2019
# Last updated by Karl Kaiser 07/02/2019

# Clone package, add relevant username and password
git clone https://github.com/kwkaiser/TechRescue.git /home/$USER/TechRescue

sed -i 's/"$USR"/"$NEWUSR"/g' /home/USER/TechRescue/automate_upload.sh
sed -i 's/"$PASSWORD"/"$NEWPASSWORD"/g' /home/USER/TechRescue/automate_upload.sh

# Notify user and build
notify-send "Beginning to run Tech Rescue build script; this may take up some resources"
sh /home/USER/TechRescue/automate_upload.sh
notify-send "Tech Rescue build finished"

# Remove remaining files  & cleanup
rm -rf /home/USER/TechRescue/
