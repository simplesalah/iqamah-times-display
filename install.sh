
#Auto-launch Chromium to iqamah page on boot
mkdir -p ~/.config/autostart
echo '[Desktop Entry]' > ~/.config/autostart/iqamah-times-display.desktop
echo 'Name=IqamahTimesDisplay' >> ~/.config/autostart/iqamah-times-display.desktop
echo 'Type=Application' >> ~/.config/autostart/iqamah-times-display.desktop
echo "Exec=/usr/lib/chromium-browser/chromium-browser --kiosk $HOME/iqamah-times-display/index.html" >> ~/.config/autostart/iqamah-times-display.desktop

#Disable screen blanking
mkdir -p ~/.config/lxsession/LXDE-pi
echo '@xset s noblank' > ~/.config/lxsession/LXDE-pi/autostart
echo '@xset -dpms' >> ~/.config/lxsession/LXDE-pi/autostart
echo '@xset s off' >> ~/.config/lxsession/LXDE-pi/autostart