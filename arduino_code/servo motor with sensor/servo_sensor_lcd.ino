#include <Servo.h>
#include <LiquidCrystal.h>

const int rs = 12, en = 6, d4 = 5, d5 = 4, d6 = 3, d7 = 2;
LiquidCrystal lcd(rs, en, d4, d5, d6, d7);
int time = 0;

Servo myservo; // Instantiate the servo object
int inputPin = 9;

const int trigPin = 10;
const int echoPin = 11;

long duration;
int distance;

void setup() 
{
  lcd.begin(16,2);
  lcd.print("Distance (cm)\t");
  pinMode(trigPin, OUTPUT);
  pinMode(echoPin, INPUT);
  Serial.begin(9600); //baud rate for serial monitor debugging
  myservo.attach(inputPin);
  myservo.write(0); // Initialize at 0 degrees
  delay(1000);
}

void loop() 
{

  digitalWrite(trigPin, LOW);
  delay(2); // 2 ms delay

  digitalWrite(trigPin, HIGH);
  delay(10); // 10 ms delay
  digitalWrite(trigPin, LOW);

  duration = pulseIn(echoPin, HIGH);

  distance = duration*.034/2; // 343 m/s converted into cm / microS 

  Serial.print("Distance (cm):");
  Serial.println(distance);
  printToScreen(distance);
  
  // If the sensor is more than 20 cm away from an object, keep moving forward

  if (distance >= 20)
  {
    runServoForward();
  }

  // If the sensor is under 20 cm away from the object, reverse
  if (distance < 20)
  {
    runServoBackwards();
  }
  
}

void runServoForward()
{
  myservo.write(15);
  delay(10);
  myservo.write(30);
  delay(10);
  myservo.write(45);
  delay(10);
  myservo.write(60);
  delay(10);
  myservo.write(75);
  delay(10);
  myservo.write(90);
  delay(10);
}

void runServoBackwards()
{
  myservo.write(90);
  delay(10);
  myservo.write(75);
  delay(10);
  myservo.write(60);
  delay(10);
  myservo.write(45);
  delay(10);
  myservo.write(30);
  delay(10);
  myservo.write(15);
  delay(10);
}

void printToScreen(int distance)
{
  lcd.setCursor(1,1);
  lcd.print(distance);
  lcd.print(" cm\t");
  delay(100);
}
