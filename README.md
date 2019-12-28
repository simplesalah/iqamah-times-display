# Iqamah Times Display
Ever wanted an iqamah times display for your masjid? If you're technically-savvy, you can easily build one yourself! By the end of this tutorial, you will inshaAllah be able to update iqamah timings by editing a Google spreadsheet. The display can also show announcements and flyers for events.

## Things you need
* Raspberry Pi 
    * Recommend getting [this set](https://www.amazon.com/dp/B07JR3M7FY), $40
    * And a case like [this one](https://www.amazon.com/dp/B07349HT26), $12
* Wifi or ethernet in masjid
* Display screen with HDMI
* HDMI male-to-male cable
* USB keyboard & mouse 
* Android-style charger
* Google or Gmail account

## Steps 

### (A) Set up Google Sheet & Slides
1. Set up Google Sheet to control timings
    1. Go to https://docs.google.com/spreadsheets/d/193VpBky_v8JTAAEjiy-g05k7eNQ7PczKqSrveZvlyGo/edit?usp=sharing
    2. Click File > Make a copy
    3. Click Share > Get shareable link
    4. You will get a URL similar to (i) above. Note the part after `/d/` and before `/edit`, like `193VpBky_v8JTAAEjiy-g05k7eNQ7PczKqSrveZvlyGo`. This is your `SPREADSHEET_ID` and we'll need it later.
2. Set up Google Slides for announcements
    1. Go to https://docs.google.com/presentation/d/1dqvfjWpRX2UOQMNwUeDjR28uIDgqFElDu47E2nlXRg0/edit
    2. Click File > Make a copy
    3. Click File > Page setup. Make sure it's 20 x 22 inches, but adjust if necessary for your display.
    4. Click Share > Get shareable link. Note the part after `/d/` and before `/edit`. This is your `SLIDES_ID` and we'll need it later.

### (B) Create a GCP account
1. Go to https://cloud.google.com and register for an account. (Might need a credit card)
2. Familiarize yourself with usage limits and pricing for the Sheets API and Cloud Functions. 

### (C) Enable Sheets API
1. On https://cloud.google.com, search for “sheets api” and click the only result.
2. Click Enable

### (D) Set up GCP API Key
We need this API key to read from Google Sheets.
1. In the search bar, type "api key", click on "APIs & Services", then click "Credentials" in the sidebar. 
2. Click "Create credentials" > "API key" > "Restrict key".
3. Change the name to "Iqamah Display".
4. Under "API restrictions", select "Restrict key" and choose "Google Sheets API" from the dropdown.
5. Click "Save".
6. Note the API Key value, we’ll need it later (`API_KEY`).

### (E) Set up Cloud Function (optional)
You should do this step if you're loading iqamah times on a publicly accessible website, and not just a display. This step just wraps the API key in a GCP Cloud Function so that the key isn't visible.
1. In https://cloud.google.com search for “cloud functions” and open the section.
2. Click "Create function", change the name to "getIqamah", set "Function to execute" to getIqamah. 
3. Create env vars named `SPREADSHEET_ID` and `API_KEY`, and set the values to ones obtained in sections A & D.
4. Open the getIqamah.js and package.json files from the same directory as this README. In the Cloud Function code editor, copy the code in getIqamah.js into the index.js tab, and package.json into the package.json tab.
5. Click Deploy, wait for it to finish, click Trigger, click the URL and make sure it shows your spreadsheet timings. Note this URL for future use.

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
6. Type `leafpad iqamah-times-display/index.html`, scroll down to the `iframe`, replace `1dqvfjWpRX2UOQMNwUeDjR28uIDgqFElDu47E2nlXRg0` with your `SLIDES_ID` from section A. Save & close.
7. Type `leafpad iqamah-times-display/IqamahDisplay.js`, find the `iqamahTimingsURL` variable. If you set up Cloud Functions in section E, use that URL in `iqamahTimingsURL`. Otherwise use `https://sheets.googleapis.com/v4/spreadsheets/SPREADSHEET_ID/values/Sheet1!B1:D11?majorDimension=COLUMNS&key=API_KEY`, but replace `SPREADSHEET_ID` and `API_KEY` with values obtained in sections A & D. Save & close.
7. Click the top-left raspberry icon > Shutdown > Reboot
