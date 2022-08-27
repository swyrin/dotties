# JSON=$(curl -s "https://location.services.mozilla.com/v1/geolocate?key=geoclue" | awk 'OFS=":" {print $3,$5}' | tr -d ',}')
# RET=$(redshift -l $JSON -p 2> /dev/null)
# TEMP=$(grep "Color temperature: " <<< $RET)
# TEMP=$(sed "s/Color temperature: //g; s/K//g" <<< $TEMP)

export REDSHIFT_TEMP=2700
export REDSHIFT=on
