const unsigned long second = 500;
const int ledPin =  LED_BUILTIN;
const unsigned long intervals[] = {30, 60, 120, 180, 240};
unsigned long previousMillis = 0;   
unsigned long interval = second;         
unsigned long n = 0;
const unsigned int NEW = 0;
const unsigned int RUNNING = 1;
const unsigned int REST = 2;
unsigned int state = NEW;
unsigned long currentMillis;

void setup() {
  pinMode(ledPin, OUTPUT);
}

void loop() {
  currentMillis = millis();
  if( state == NEW) 
  {
    previousMillis = currentMillis;
    n = random(1,5);
    interval = second * intervals[n -1];
    for(int i = 0; i < n; i++) {
      digitalWrite(ledPin, HIGH);
      delay(100);
      digitalWrite(ledPin, LOW);
      delay(100);
    }
    state = RUNNING;
  }

  if( state == RUNNING) 
  {
    if (currentMillis - previousMillis >= interval / 2) {
      digitalWrite(ledPin, HIGH);
      delay(200);
      digitalWrite(ledPin, LOW);
      delay(200);
      digitalWrite(ledPin, HIGH);
      delay(1000);
      digitalWrite(ledPin, LOW);
      state = REST;
    }
  }

  if( state == REST) 
  {
    if (currentMillis - previousMillis >= interval) {
      state = NEW;
    }
  }
}

