#! /bin/bash

#
# cec-control - Controls HDMI-CEC enabled displays
#

VCGENCMD=$(which vcgencmd)
CECCLIENT="$(which cec-client) -s -d 1"

# Get RPI and TV display status
hdmi_on=$($VCGENCMD display_power | awk -F '=' '{print $2}')
tvpower=$(echo 'pow 0' | $CECCLIENT | grep power | awk '{print $3}')

# Turn on RPI display if off
# if [ ${hdmi_on} == '0' ]; then
#   # echo "Turning on RPI display"
#   $VCGENCMD display_power 1
# fi

# Turn off TV if on
if [ ${tvpower} == 'on' ]; then
  # echo "Turning off TV"
  echo 'standby 0' | $CECCLIENT
fi
