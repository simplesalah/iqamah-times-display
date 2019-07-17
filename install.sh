#!/bin/bash

#Set base directory
BASE_DIR=$HOME/iqamah-times-display

#Auto-launch Chromium to iqamah page on boot
mkdir -p ~/.config/autostart
echo '[Desktop Entry]' > ~/.config/autostart/iqamah-times-display.desktop
echo 'Name=IqamahTimesDisplay' >> ~/.config/autostart/iqamah-times-display.desktop
echo 'Type=Application' >> ~/.config/autostart/iqamah-times-display.desktop
echo "Exec=$BASE_DIR/launch-display.sh $BASE_DIR/index.html" >> ~/.config/autostart/iqamah-times-display.desktop