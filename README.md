# Iqamah Times Display
It's easy to build your own iqamah times display for your masjid. At the end of this tutorial, you should be able to update your iqamah times display using a Google spreadsheet.

## Things you need
* Raspberry Pi ($40 from [Amazon](https://www.amazon.com/dp/B07JR3M7FY))
* Wifi or ethernet in masjid
* Display screen with HDMI
* HDMI male-to-male cable
* USB keyboard & mouse 
* Android-style charger

## Steps 

### Set up Raspberry Pi
1. Plug SD card, keyboard, mouse, charger, and HDMI cable into Raspberry Pi. Plug other end of HDMI cable into display. Turn Raspberry Pi on.
2. Connect to wifi or ethernet
3. Select Raspbian, click Install. Follow steps to setup OS
    * Set correct timezone
    * Click next on “Update Software” and restart
4. Click the Terminal icon in the top-left (black rectangle).
5. Type the following:
    ```
    git clone git@github.com:simplesalah/iqamah-times-display.git

    iqamah-times-display/install.sh
    ```
6. Click the top-left raspberry icon > Shutdown > Reboot
