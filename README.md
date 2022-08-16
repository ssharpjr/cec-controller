# Controlling HDMI displays via CEC on RPI

## Requirements

Install ```cec-utils```
```bash
sudo apt install cec-utils -y
```

## Install

Copy scripts to ```/usr/local/bin```
```bash
cd cec-controller
sudo cp cec-off.sh cec-on.sh /usr/local/bin/
```

Copy ```crontab.txt``` to root's cronjobs
```bash
cd cec-controller
sudo crontab crontab.txt
```
