import processing.serial.*;

Serial myPort;  // Create object from Serial class
boolean startFire = false;
String val;     // Data received from the serial port

void setup(){
  // Open whatever port is the one you're using.
  String portName = Serial.list()[2]; //change the 0 to a 1 or 2 etc. to match your port
  myPort = new Serial(this, portName, 9600); 
}

void draw()
{
  if(!startFire){
    
    // If data is available, read it and store it in val
    if(myPort.available() > 0){  
      val = myPort.readStringUntil('\n');  
      
      if( val.trim().equals("true") ){
        startFire = true;
        println(val); //print it out in the console
      }
      
    }
    
  }
  
  
}

