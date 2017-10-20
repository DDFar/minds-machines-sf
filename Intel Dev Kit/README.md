# Minds and Machines San Francisco Hackathon 2017
# Intel Dev Kit Documentation

## Connect, and start building

Wire your board, experience the IoT Edge, send the data to a cloud app that you can leverage for the Hackathon. The cloud app is based on the Predix Polymer [Web App Starter](https://www.predix.io/resources/tutorials/journey.html#2100) and [Reference App](https://www.predix.io/services/starter-pack.html?id=1224). This makes it easy to connect to cloud services with API SDKs for major services in various languages.
The solution comes with a personal cloud app to get started quickly with a full front-end and back-end cloud application, setup of cloud services and source code.

## What is Intel NUC?
The Intel® NUC is a powerful 4x4-inch mini PC, including a customizable board. The NUC is adaptable to accept additional memory, storage, and operating systems.

## How can the NUC support the Appathon challenge?

At the Minds+Machines appathon, your mission is to address one of the problems in the areas of [Decarbonization, Decentralization, and Digitization](https://mmsf17.devpost.com/). The Developer Kit can help you getting an edge with your project, by rapidly connecting live data feeds off sensors to your Predix applications. For instance, you could build a heat pump simulator using the Kit to generate real-time temperature data and use it in your Predix cloud space.

## What is your team provided with?

Each participating team will receive (while supply lasts):

- 1 NUC board DE3815TYKE
- 1 complete set of the “original” [intel gateway sensor kit](https://www.seeedstudio.com/Grove-IoT-Commercial-Gateway-Kit-p-2724.html)
  - Sensors:
    - Grove – Button
    - Grove – Sound Sensor v1.2
    - Grove – Touch Sensor
    - Grove – Light Sensor v1.2
    - Grove – Temperature Sensor v1.1
    - Grove – Rotary Angle Sensor(p)
    - Grove – Piezo Vibration Sensor
  - Actuators:
    - Grove – LCD RGB Backlight
    - Grove – Buzzer
    - Grove – Red LED
    - Grove – Green LED
    - Grove – Blue LED
    - Gear Stepper Motor with Driver
  - Others:
    - Grove Base Shield v2
    - (14) 26AWG Grove Cables
    - Arduino or Genuino
    - B to A Type USB Cable – 0.5m


In addition, 2 lots of 15 sets of alternate sensors will be available on demand:
1.	First type of set is based upon a slightly modified version of https://wiki.openenergymonitor.org/index.php/EmonTx_Arduino_Shield and can monitor AC voltage and current
2.	Second type of set is based on the http://www.switchdoc.com/sunairplus-solar-power-controllerdata-collector/ and can be used to monitor 3 set of voltage and current for a small solar panel, a li-po battery and a USB load

## How to access data generated from the Kit?

The dataflow is as follows:
1.	Data generated from sensors is collected by an instance of [Predix Machine](https://docs.predix.io/en/content/service/edge_software_and_services/machine/predix-machine-overview) deployed on the board. Sensor data is interpreted by the Predix Machine using an adaptor leveraging Intel sensor libraries.
2.	The Predix Machine buffers this data locally (store and forward).
3.	A [predix-machine-template-processor](https://github.com/PredixDev/predix-machine-template-processor) logs the data going by. 
4.	The Predix Machine sends the data to a shared Predix Timeseries instance the cloud
5.	Access the data from the Predix Timeseries instance!
You can find more information about getting started with [Predix Machine](https://www.predix.io/resources/tutorials/journey.html#Edge) here.

## How to customize the Predix Machine to access your own Time Series instance
1. Using a browser, visit the Documentation tab of the Predix Developer Kit web site.
2. Click on the link for Customize Predix Machine and follow the tutorial.  Here is the direct link.  https://www.predix.io/resources/tutorials/journey.html?environment=workshop#2365


