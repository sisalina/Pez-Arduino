  const int motor1Pin = 2;    // H-bridge leg 1 (pin 2, 1A)
  const int motor2Pin = 3;    // H-bridge leg 2 (pin 7, 2A)
  const int enablePin = 8;    // H-bridge enable pin
  int potpin = 1;  // analog pin used to connect the potentiometer
  int val;    // variable to read the value from the analog pin 
    
  void setup() {
    
    // set all the other pins you're using as outputs:
    pinMode(motor1Pin, OUTPUT); 
    pinMode(motor2Pin, OUTPUT); 
    pinMode(enablePin, OUTPUT);
    digitalWrite(enablePin, HIGH); 
    Serial.begin(9600);
  }
  
  void loop() {
     val = analogRead(potpin)*0.40039-205;            // reads the value of the potentiometer (value between 0 and 1023) 
     Serial.print(205+val);    // Test 1
     Serial.print("  ");   // Formato Test 1
 // Acá comienza el alternado de puente H
       
      digitalWrite(motor1Pin, LOW);   // set leg 1 of the H-bridge low
      digitalWrite(motor2Pin, HIGH);  // set leg 2 of the H-bridge high
    
    delay(abs(205+val)*1.045);
    
      digitalWrite(motor1Pin, HIGH);  // set leg 1 of the H-bridge high
      digitalWrite(motor2Pin, LOW);   // set leg 2 of the H-bridge low
    
    delay(abs(205+val)*1);
   }
