const latitude = 37.7749; //negative value for South, positive for North
const longitute = -122.4194; //negative value for West, positive for East
const asrMethod = 'Standard'; //either Hanafi or Standard
const calcMethod = 'ISNA'; //or MWL, Makkah, Karachi, etc
const cloudFunctionUrl = 'https://us-central1-simple-salah-1546243001528.cloudfunctions.net/getIqamah';

function getAthanTimes() {
    prayTimes.setMethod(calcMethod); 
    prayTimes.adjust( {asr: asrMethod} );
    return prayTimes.getTimes(new Date(), [latitude, longitute], 'auto', 'auto', '12h');
}

function updateTimes() {
    fetch(cloudFunctionUrl)
    .then((resp) => resp.json())
    .then((data) => {
        let athanTimes = getAthanTimes();
        let iqamahTimes = data.values[0];
        let mode = data.values[2][1];

        let jumahElements = ['english1', 'arabic1', 'english2', 'arabic2'];
        let elementIds = ['fajr', 'dhuhr', 'asr', 'maghrib', 'isha'].concat(jumahElements);

        for (let i=0; i<elementIds.length; i++) {
            let prayerName = elementIds[i];
            let iqamahTime = iqamahTimes[i];
            
            //update athan time 
            try {
                document.getElementById(prayerName+'-athan').textContent = athanTimes[prayerName];
            } catch { }

            //update iqamah time
            try {
                if (mode.includes('offset') && !jumahElements.includes(prayerName)) {
                    let athanTime = document.getElementById(prayerName+'-athan').textContent;
                    let offset = parseInt(iqamahTime);
                    let offsetIqamah = moment(athanTime, 'HH:mm a').add(offset, 'minutes').format('h:mm a');
                    document.getElementById(prayerName).textContent = offsetIqamah;
                }
                else {
                    document.getElementById(prayerName).textContent = iqamahTime;
                }
            } catch { }
        }
    })
    .catch((error) => {
        console.error(error);
    });
}