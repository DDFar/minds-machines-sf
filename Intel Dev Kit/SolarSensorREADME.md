# Intel Dev Kit Documentation

## Solar Panel and Battery Sensor Kit

This sensor and controller board monitors three voltage and current channels, Solar Panel, Lipo Battery and USB Load, and uses a standard I2C Grove connection.  
Two test programs have been combined to create a wireless sensor assembly that outputs its data to an MQTT broker. 
This wireless sensor can be easily incorporated into a Node-Red flow, by specifying the broker IP address in the flow and by subscribing to the following topics.
The battery topic is Lipo, the solar panel topic is Solar and the USB output topic is Load. Four subtopics are published for each of the battery, the panel and the load.


      Lipo/BusVoltage    Solar/BusVoltage				Load/BusVoltage
      Lipo/ShuntVoltage  Solar/ShuntVoltage		Load/ShuntVoltage
      Lipo/LoadVoltage   SolarLoadVoltage				Load/LoadVoltage
      Lipo/Current       Solar/Current							Load/Current
      
From the Gateway these can be tested at the command line by using “mosquito_sub –t Lipo/Current” -h (IP of Sensor).  The sensor IP is displayed on the LCD, (hint: look under the solar panel)

## Subscribing to a Solar Charger Topic on the Gateway
Ensure that the Gateway and the Edison/Sensor are on the same subnet, and can ping each other before proceeding.  As this example is built, it is using the MQTT Broker on the Edison for the sensor topics, while the MQTT broker on the gateway is used to hold the messages for the DevHub Guages and Line graphs.
 
This example flow  (example-node-solar.json) reads one topic from the Edison, and sends it to the display broker and the debug channel. It can be imported to node-red 

The Lipo Current input device is a MQTT node, the IP address is the Edison.
  
The battery current can be +/- 1000mA, either charging or discharging, therefore the range on this dialog has been changed to fit this requirement.

## Is it too dark to charge the battery?

To charge the battery, the solar panel needs to generate more than ~5Volts, and indoors may not be bright enough to derive this voltage. Therefore the system is supplied with  another USB cable in the case that
can be connected to the mini-USB connector on the Sun-Air board. The AC power adapter has a spare USB output, and the battery can be charged using this method.

## Suggested use cases.

This sensor can be used standalone to simulate a larger facility, for example a car charging station, to derive test scenarios for your Predix application.  Real Time fault detection- (remove the battery)
or insufficient charging (cover up the solar panel) could be used to trigger maintenance events.

There are ten sensors in the room, and data from several of these sensors could be used to test an algorithm for electric vehicle route planning. As the voltage/current varies in real time, or even, 
as sensors go offline, alternate routes that optimize charging can be developed.  