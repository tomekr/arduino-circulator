/*******************************************************************************
* POP-BOT V1.0
* Filename : SimpleLCD.pde
* Show message on SLCD
********************************************************************************/

#include <SoftwareSerial.h>
#define rxPin 16
#define txPin 16

int temp;
int TEMP_SENSOR_PIN = 7;

SoftwareSerial MySerial = SoftwareSerial(rxPin,txPin);

void setup(){
  digitalWrite(txPin,HIGH);
  delay(1000);
  pinMode(txPin,OUTPUT);
  MySerial.begin(9600);
  delay(1000);
}

void loop(){
  temp = analogRead(7);
  
  MySerial.print(0xFE,BYTE);
  MySerial.print(0x80,BYTE);
  MySerial.print("POP-BOT");
  MySerial.print(0xFE,BYTE);
  MySerial.print(0xC0,BYTE);
  MySerial.print(temp);
  delay(1000);
}

//void loop()                     // run over and over again
//{
// //getting the voltage reading from the temperature sensor
// int reading = analogRead(TEMP_SENSOR_PIN);  
// 
// // converting that reading to voltage, for 3.3v arduino use 3.3
// float voltage = reading * 5.0;
// voltage /= 1024.0; 
// 
// // print out the voltage
// MySerial.print(0xFE,BYTE);
// MySerial.print(0x80,BYTE);
// MySerial.print(voltage); MySerial.print(" volts");
// 
// // now print out the temperature
// float temperatureC = (voltage - 0.5) * 100 ;  //converting from 10 mv per degree wit 500 mV offset
//                                               //to degrees ((volatge - 500mV) times 100)
//                                               
// MySerial.print(0xFE,BYTE);
// MySerial.print(0xC0,BYTE);                                              
// //MySerial.print(temperatureC); MySerial.println(" degrees C");
// 
// // now convert to Fahrenheight
// float temperatureF = (temperatureC * 9.0 / 5.0) + 32.0;
// MySerial.print(temperatureF); MySerial.println(" degrees F");
// 
// delay(1000);                                     //waiting a second
//}
