const axios = require('axios');

const url = 'https://sheets.googleapis.com/v4/spreadsheets/' +
             process.env.SPREADSHEET_ID + 
             '/values/Sheet1!B1:D11?majorDimension=COLUMNS&key=' +
             process.env.API_KEY;

exports.getIqamah = (req, res) => {
  axios.get(url)
  .then((timings) => {
    res.status(200).send(JSON.stringify(timings.data));
  })
  .catch((error) => {
    res.status(500).send(JSON.stringify(error));
  });
};
