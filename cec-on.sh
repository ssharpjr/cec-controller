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
if [ ${hdmi_on} == '0' ]; then
  # echo "Turning on RPI display"
  $VCGENCMD display_power 1
fi

# Turn on TV if off
if [ ${tvpower} == 'standby' ] || [ ${tvpower} == 'unknown' ]; then
  # echo "Turning on TV"
  echo 'on 0' | $CECCLIENT
fi
