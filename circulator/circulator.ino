#include <SoftwareSerial.h>

#define rxPin 16
#define txPin 16
SoftwareSerial LCD(rxPin,txPin); // serial LCD

int sensorPin = 6; //the analog pin the TMP36's Vout (sense) pin is connected to

void setup()
{
  digitalWrite(txPin,HIGH);
  delay(500);
  pinMode(txPin,OUTPUT);
  LCD.begin(9600);
  delay(500);
}

void loop()
{
  //getting the voltage reading from the temperature sensor
  int reading = analogRead(sensorPin);  

  // converting that reading to voltage, for 3.3v arduino use 3.3
  float voltage = reading * 5.0;
  voltage /= 1024.0; 
  
  // now print out the temperature
  float temperatureC = (voltage - 0.5) * 100 ;  //converting from 10 mv per degree wit 500 mV offset
  
  LCD.write(byte(0xFE));
  LCD.write(byte(0x80));
  
  LCD.print(temperatureC); 
  LCD.print(" degrees C");
  
  // now convert to Fahrenheight
  float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;

  LCD.write(byte(0xFE));
  LCD.write(byte(0xC0));
  
  LCD.print(temperatureF); 
  LCD.print(" degrees F");
  
  delay(1000);
}
