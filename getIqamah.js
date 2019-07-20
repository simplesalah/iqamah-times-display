const axios = require('axios');

const url = 'https://sheets.googleapis.com/v4/spreadsheets/' +
             process.env.SPREADSHEET_ID + 
             '/values/Sheet1!B1:D11?majorDimension=COLUMNS&key=' +
             process.env.API_KEY;

exports.getIqamah = (req, res) => {
  axios.get(url)
  .then((timings) => {
    res.set('Access-Control-Allow-Origin', '*');
    res.status(200);
    res.send(timings.data);
  })
  .catch((error) => {
    res.set('Access-Control-Allow-Origin', '*');
    res.status(500);
    res.send(error);
  });
};
