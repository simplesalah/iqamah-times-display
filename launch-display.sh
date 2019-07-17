#!/bin/bash
#
# Requires command line arg: path to webpage to launch

#Disable screen blanking 
xset s off
xset -dpms
xset s noblank

#Prevent chromium error dialogs
sed -i 's/"exited_cleanly":false/"exited_cleanly":true/' ~/.config/chromium/Default/Preferences
sed -i 's/"exit_type":"Crashed"/"exit_type":"Normal"/' ~/.config/chromium/Default/Preferences

#Launch chromium on iqamah page
/usr/lib/chromium-browser/chromium-browser --kiosk $1