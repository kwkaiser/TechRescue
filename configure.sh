# This script just modifies buildscripts to have relevant user folder variable named

# Replace $USER in anacron_script.sh:
echo "Enter the username of this computer (home folder name)"
read COMPNAME
sed -i "s/USER/$COMPNAME/g" automate_upload.sh
sed -i "s/USER/$COMPNAME/g" anacron_script.sh

# Replace name for wifi account
echo "Enter the username of the default wifi account"
read WIFIUSR
sed -i "s/NEW_WIFI_USR/$WIFIUSR/g" anacron_script.sh
echo "Enter the default wifi account's password"
read WIFIPASS
sed -i "s/NEW_WIFI_PASS/$WIFIPASS/g" anacron_script.sh

# Replace $NEWU in anacron_script.sh
echo "Enter the name of the account for the share drive"
read NEWU
sed -i "s/NEWU/$NEWU/g" anacron_script.sh

# Replace $NEWP in anacron_script.sh
echo "Enter the password of the account for the share drive"
read NEWP
sed -i "s/NEWP/$NEWP/g" anacron_script.sh

# Move anacron script to sbin, add item to anacrontab
cp anacron_script.sh /usr/local/sbin/anacron_script
echo "#Tech Rescue" >> /etc/anacrontab
echo "7 30 techrescue_build sh /usr/local/sbin/anacron_script" >> /etc/anacrontab

