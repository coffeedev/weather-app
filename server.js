const express = require('express');
const util =  require('util') ;
const bodyParser = require('body-parser');
const request = require('request');
const app = express()
const winston = require('winston');
//const { version } = require('./package.json');
const current_version = process.env.npm_package_version;

const logger = winston.createLogger({
  level: 'info',
  format: winston.format.json(),
  transports: [new winston.transports.Console()],
});

const apiKey = '590b5dc12ebc120eb147901bce11b9fb' ;

app.use(express.static('public'));
app.use(bodyParser.urlencoded({ extended: true }));
app.set('view engine', 'ejs');


module.exports = logger;

app.get('/', function (req, res) {
  res.render('index', {weather: "Select a City", error: null});
})

app.post('/', function (req, res) {
  let city = req.body.city;
  let url = `http://api.openweathermap.org/data/2.5/weather?q=${city}&units=metric&appid=${apiKey}`

  request(url, function (err, response, body) {
    if(err){
      res.render('index', {weather: null, error: 'Error, please try again'});
      logger.error("Unable to fetch data for city:" + city) ;
    } else {
      let weather = JSON.parse(body)
      if(weather.main == undefined){
        res.render('index', {weather: null, error: 'Error, please try again2'});
        logger.error("Unable to fetch data for city:" + city) ;
      } else {
        let weatherText = util.format("It's %d degrees in %s, with %d pressure and humidity at %d. Current Conditions : %s",  `${weather.main.temp}`,
        `${weather.name}`, `${weather.main.pressure}`, `${weather.main.humidity}`, `${weather.weather[0].description}`)
        //let weatherText = `It's ${weather.main.temp} degrees in ${weather.name}! `;
        //weatherText = weatherText + "\r\n pressure : " + `${weather.main.pressure}` ;
        //weatherText = weatherText + "\r\n humidity : " + `${weather.main.humidity}` ;
        res.render('index', {weather: weatherText, error: null});
        logger.info("Weather data fetched for city:" + city) ;
      }
      
    }
  });
})

app.listen(8090, function () {
  console.log('Example app listening on port 8090!') ;
  logger.info("Current version: " + current_version) ;
  console.log("-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-=-") ;
})
