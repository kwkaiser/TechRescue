# Written by Karl Kaiser 07/02/2019
# Last updated by Karl Kaiser 07/02/2019

# Export variable to describe datetime in a certain format
export HISTTIMEFORMAT='  %Y%m%d%H%M%S   '

# Find the time of the last issued ./automate_upload command, excluding any other common commands that may have called it.
export date1=$(history | grep -w "automate_upload.sh" | grep -v -e "grep" -e "cat" -e "vim" -e "git" -e "chmod" -e "chown" | tail -n -1 | awk -F '   |   ' '{print $2}')

# Find the current date and time
export date2=$(date +'%Y%m%d%H%M%S')

# Calculate difference between times
export time_passed=$(datediff -i '%Y%m%d%H%M%S' -f '%S' $date1 $date2)

# If the automate_upload.sh script hadn't been run in the past 7 days, run it.
if [$time_passed -gt 604800];
    git clone https://github.com/kwkaiser/TechRescue.git ~/Desktop/TechRescue
    sh ~/Desktop/TechRescue/automate_upload.sh
fi

