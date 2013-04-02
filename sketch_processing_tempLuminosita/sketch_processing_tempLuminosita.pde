import processing.serial.*;
import processing.net.*;
import controlP5.*;


Serial myPort;  // Create object from Serial class

String code;
float  valTemp;
int    valLum;
Client myclient;
String cmd;
ControlP5 cp5;

String textValue = "";

void setup() 
{
  size(300, 300);
  PFont font = createFont("arial",20);
  
  cp5 = new ControlP5(this);
  
  cp5.addTextfield("input")
     .setPosition(20,100)
     .setSize(200,40)
     .setFont(font)
     .setFocus(true)
     .setColor(color(255,0,0))
     ;
  background(0);
  fill(255);
  text(cp5.get(Textfield.class,"input").getText(), 360,130);
  text(textValue, 360,180);  myclient = new Client(this, "localhost", 8080);
}

void draw() {
  
  if(myPort!=null && myPort.available() > 0) {
    code = myPort.readStringUntil(10);    
      if (code!=null){
      println(code);
      String [] response = loadStrings("http://localhost:8080/rilevazioni/insert.php?"+code);
      println(response);    
    }
  }
  //println("out");
}

void controlEvent(ControlEvent theEvent) {
  if(theEvent.isAssignableFrom(Textfield.class)) {
    if (theEvent.getName()=="input"){
      println("Starting "+theEvent.getStringValue()+"...");    
      myPort = new Serial(this, theEvent.getStringValue(), 9600);// /dev/ttyACM0
      myPort.clear();  
    }
  }
}

