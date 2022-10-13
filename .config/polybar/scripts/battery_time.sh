TIME=$(acpi | awk '{print $5}')
CHARGE=$(acpi | grep "Charging")

if [[ -z $CHARGE ]]
then
    notify-send "Battery" "$TIME of battery time left" --expire-time=1000
else
    notify-send "Battery" "$TIME until fully charged" --expire-time=1000
fi
