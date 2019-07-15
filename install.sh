
#Auto-launch Chromium to iqamah page on boot
mkdir -p ~/.config/autostart
cp iqamah-times-display.desktop ~/.config/autostart/.

#Disable screen blanking
sudo xset s off
sudo xset -dpms
sudo xset s noblank