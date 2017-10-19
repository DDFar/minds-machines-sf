# Placeholder for scripts to setup user space

#Creating heatpump cups
#Creating loadpump cups
cf cups MMSanFrancisco_timeseries_loadData -p '{"query":{"uri":"https://time-series-store-predix.run.aws-usw02-pr.ice.predix.io/v1/datapoints","zone-http-header-name":"Predix-Zone-Id","zone-http-header-value":"2dc1efc3-10d3-4262-8f0d-6a990160aed3"}}'

#Creating heatpump cups
cf cups MMSanFrancisco_timeseries_heatPump -p '{"query":{"uri":"https://time-series-store-predix.run.aws-usw02-pr.ice.predix.io/v1/datapoints","zone-http-header-name":"Predix-Zone-Id","zone-http-header-value":"d23057a0-0cd3-4f50-ae72-918883641e98"}}'

#Creating uaa cups
cf cups MMSanFrancisco_uaa_admin -p '{"uri":"https://0f074596-79e5-4a1d-8900-707be1c73815.predix-uaa.run.aws-usw02-pr.ice.predix.io"}'
