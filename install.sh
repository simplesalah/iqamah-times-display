sudo cp iqamah-times-display.service /etc/systemd/system/.
sudo systemctl daemon-reload
sudo systemctl enable iqamah-times-display.service
sudo systemctl start iqamah-times-display
