# This script just modifies buildscripts to have relevant user folder variable named

# Replace $USER in anacron_script.sh:
echo "Enter the username of this computer (home folder name)"
read COMPNAME
sed -i "s/USER/$COMPNAME/g" automate_upload.sh
sed -i "s/USER/$COMPNAME/g" anacron_script.sh

# Replace $NEWU in anacron_script.sh
echo "Enter the name of the account for the share drive"
read NEWU
sed -i "s/NEWU/$NEWU/g" anacron_script.sh

# Replace $NEWP in anacron_script.sh
echo "Enter the password of the account for the share drive"
read NEWP
sed -i "s/NEWP/$NEWP/g" anacron_script.sh

echo "Now enter the updated credentials for the relevant servershare to the automate_upload.sh script"
