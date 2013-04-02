int analogInPin = A0;
int analogInPinT= A4;
int sensorValue = 0;
int sensorValueT= 0;


void setup() {
  Serial.begin(9600);
  pinMode( analogInPin, INPUT);
  pinMode( analogInPinT, INPUT);
}

void loop() {
  sensorValue = analogRead(analogInPin);  
  sensorValueT = analogRead(analogInPinT);

  Serial.print("valLum=");
  Serial.print(sensorValue,DEC);
  Serial.print("&valTemp=");
  Serial.println(sensorValueT,DEC);

  delay(1000);
}



