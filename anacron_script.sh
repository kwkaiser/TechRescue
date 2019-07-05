# Written by Karl Kaiser 07/02/2019
# Last updated by Karl Kaiser 07/02/2019

git clone https://github.com/kwkaiser/TechRescue.git ~/Documents/TechRescue
sed -i 's/"$USERNAME"/"[putnamehere]"/g' ~/Documents/TechRescue/automate_upload.sh
sed -i 's/"$PASSWORD"/"[putpasshere]"/g' ~/Documents/TechRescue/automate_upload.sh
sh ~/Documents/TechRescue/automate_upload.sh
rm -rf ~/Documents/TechRescue/
