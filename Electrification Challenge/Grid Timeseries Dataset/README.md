# Minds and Machines SF Hackathon 2017
# Electrification Challenge - Grid Timeseries Dataset

## Who is ESB?

Electricity Supply Board (ESB) was established in 1927 as a statutory corporation in the Republic of Ireland under the Electricity (Supply) Act 1927. With a holding of 95%, ESB is majority owned by the Irish Government with the remaining 5% held by the trustees of an Employee Share Ownership Plan.  

As a strong, diversified, vertically integrated utility, ESB operates right across the electricity market: from generation, through transmission and distribution to supply. In addition, ESB extracts further value at certain points along this chain: supplying gas, using our networks to carry fibre for telecommunications, developing electric vehicle public charging infrastructure and more.


## What is the challenge?

Adding renewables, electric vehicles, electric heating and other loads to the electric grid to drive decarbonization will increase congestion on the grid. It will become more and more critical to have accurate forecasting of demand for power and load on circuits. The fundamental determinant for electrical load is outdoor temperature.

Help ESB develop an algorithm that can more accurately predict load based on type of load and on how heating demands are impacted by the weather.


## What's in the dataset?

This dataset gathers electrical load data and weather data for the following substations:
- Knockroe
- Letterkenny_Dromore
- Malahide_Castle
- Mullingar
- Shannon_Airport_Area


### Historic electrical load data from ESB

For each substation the electrical load data is provided for several feeders ("DC14", "LE17", etc). Each feeder has an associated load type ("residential", "Ind/Com" or "Mixed"). You can find the feederID - feeder type mapping in the original CSV files.

Timeseries dataset characteristics:
- Timeperiod: 1 year from May 2016 - May 2017
- Timestep: 30 minutes
- All tags are a current measurement expressed in AMPS

NB: you can find each feeder voltage level in the original files in the data folder.


### Historic data from the Irish Meteorological Service

You can find detailed field description in the "KeyHourly.txt" file in the "WeatherData" folder.

For each substation the available weather data tags are:
- Precipitation Amount (mm)
- Air Temperature (C)
- Wet Bulb Temperature (C)
- Dew Point Temperature (C)             
- Relative Humidity (%)
- Vapour Pressure (hPa)
- Mean Sea Level Pressure (hPa)
- Mean Wind Speed (knot)
- Predominant Wind Direction (degree)
- Synop code for Present Weather
- Synop code for Past Weather
- Sunshine duration (hours)
- Visibility (m)
- Cloud height (100's of ft) - 999 if none
- Cloud amount

Timeseries dataset characteristics:
- Timeperiod: 10 years - 30 years depending on the station
- Timestep: 1 hour

## How to access the dataset?

This data is accessible in two formats:
- A Predix Time series instance that you can access read-only using the following references:
  - UAA URL: https://0f074596-79e5-4a1d-8900-707be1c73815.predix-uaa.run.aws-usw02-pr.ice.predix.io
  - ClientID: timeseries_client_readonly
  - Client Secret: secret
  - Timeseries ZoneID: 2dc1efc3-10d3-4262-8f0d-6a990160aed3

- CSV files on Hackathon GitHub repo for a preliminary exploration. Please note that your prototype should be deployed on Predix and access data from Predix.
