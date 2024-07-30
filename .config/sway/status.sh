date_formatted=$(date "+%Y-%m-%d %I:%M:%S %p")
battery_level=$(cat /sys/class/power_supply/BAT0/capacity)
battery_icon=$(
if [ $battery_level -gt 90 ]; then echo "󰁹"; 
elif [ $battery_level -gt 70 ]; then echo "󰂀"; 
elif [ $battery_level -gt 50 ]; then echo "󰁾"; 
elif [ $battery_level -gt 30 ]; then echo "󰁼"; 
else echo "󰁺"; 
fi)
is_charging=$(if []; then echo "󱐋"; else echo ""; fi)
filesystem_usage=$(df -h / | awk '{ print $5 }' | tail -n 1)

echo "/ $filesystem_usage | RAM | CPU | $is_charging$battery_icon $battery_level% | $date_formatted"
