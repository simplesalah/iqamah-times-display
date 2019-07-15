
#Auto-launch Chromium to iqamah page on boot
mkdir -p ~/.config/autostart
echo '[Desktop Entry]' > ~/.config/autostart/iqamah-times-display.desktop
echo 'Name=IqamahTimesDisplay' >> ~/.config/autostart/iqamah-times-display.desktop
echo 'Type=Application' >> ~/.config/autostart/iqamah-times-display.desktop
echo "Exec=/usr/lib/chromium-browser/chromium-browser --kiosk $HOME/iqamah-times-display/index.html" >> ~/.config/autostart/iqamah-times-display.desktop

#Disable screen blanking
sudo mkdir -p /etc/xdg/lxsession/LXDE-pi/
sudo echo '@xset s noblank' >> /etc/xdg/lxsession/LXDE-pi/autostart
sudo echo '@xset -dpms' >> /etc/xdg/lxsession/LXDE-pi/autostart
sudo echo '@xset s off' >> /etc/xdg/lxsession/LXDE-pi/autostart