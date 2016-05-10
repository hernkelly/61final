//Project 5 by Kelly Hernandez
//CST 112 with professor bam


float horizon;
float miniH, maxH;
float miniW, maxW;

float sunx;

boolean array = true;

int cloudsn = 7;
int many = 11;  //number of humanss

Cloud[] clouds = new Cloud[cloudsn];  //starting human and clouds
Person[] human = new Person[many];    //setting up 2 Person arrays, human and kel
Person[] kel = new Person[many];

//list of names for the human
String[] names = {"Jana", "Alex", "Ferna", "Serra", "Teresa", "George", "Isabe", "Jacob", "Ava", 
  "William", "Mia", "Ethan", };

Button help, quit, randomize, Taller, Wider, Fatter, order, change, raise, bonus;  //buttons

void setup() {

  size(750, 550);

  horizon = height/1.5;    //setting horizon
  sunx = 0;    //starting sun/moon position
  //human sizes
  miniH = 50;      //the human's height and width follow 
  maxH = 150;      // smallest and largest values the human can be
  miniW = 25;       //directly between the two numbers
  maxW = 45;

  //position and names of buttons
  quit = new Button(width/2 + width/2.5 -60, height - height/16, "quit");
  randomize = new Button(width/2 + width/2.5 -120, height - height/16, "random");
  order = new Button(width*2 + width*2.5 -180, height - height/16, "order");
  Taller = new Button(width/2 + width/2.5 -240, height - height/16, "Taller");
  Wider = new Button(width/2 + width/2.5 -300, height - height/16, "Wider");
  Fatter = new Button(width/2 + width/2.5 -360, height - height/16, "Fatter"); 
  change = new Button(width/2 + width/2.5 - 180, height - height/16, "change");
  raise = new Button(width/2 + width/2.5, height - height/16, "raise");
  bonus = new Button(width/2 + width/2.5 -420, height - height/16, "bonus");

  sHuman();    //setting up human then clouds
  cloudB();
}


void draw() {
  scene();
  show();
  numbers();
  messages();
}  



void cloudB() {


  float wide = 0;
  float x = -100;
  float y = 0;

  cloudsn = int( random(1, 8));       //random width and y coordinate
  wide = random(150, 200);
  y = random(horizon/2);

  for (int n = 0; n < clouds.length; n++) {
    clouds[n] = new Cloud(wide - n*20, x - n*100, y + n*50);    //each one gets smaller and moves downward and leftward
  }
}

void sHuman() {
  for (int n = 0; n < many; n++) {
    human[n] = new Person();    //initializing human
    kel[n] = new Person();     // initializing kel
    human[n].startup();
    kel[n].startup();
  }

  for (int n = 0; n < many; n++) { 
    human[n].x = 60 + (n * 60);    //distance between humans
    kel[n].x = 100 + (n * 30);    //placing kel
  }
}

void scene() {  
  noStroke();
  if ( array == true) {
    rectMode(CORNER);
    fill(150, 250, 220);              //blue sky
    rect(0, 0, width, horizon);
  } else {
    rectMode(CORNER);
    fill(75, 100, 150);              //night sky new
    rect(0, 0, width, horizon);
  }

  sunx += .5;

  if ( array == true) {
    fill(240, 236, 0);                      //yellow sun
    ellipse(sunx, horizon/2, 50, 50);
  } else {
    noStroke();
    fill(220, 220, 220);                  //white moon
    ellipse(sunx, horizon/2, 50, 50);
    fill(200, 200, 200, 220);                    //with some craters
    ellipse(sunx -10, horizon/2 -10, 15, 15);
    ellipse(sunx +13, horizon/2 +7, 10, 10);
    ellipse(sunx-5, horizon /2 +8, 20, 20);
  }  


  for (int n = 0; n < cloudsn; n+=3) {   //clouds running
    clouds[n].movement();
    clouds[n].show();
  }

  fill(50, 150, 0);  //grass color and width
  rect(0, horizon, width, height);  //ground


  stroke(0, 100, 0);
  strokeWeight(7);
  for ( int n = 0; n < width + 25; n+=15) {
    if ( array == false) {
      line(-15+n, height, 0+n, height - 16);  //right leaning for new
    } else if (array == true) {
      line(15+n, height, 0+n, height - 16);    //left leaning for old
    }
  }
}

void show() {

  if (array == true) {
    for (int n = 0; n < many; n++) {       //showing human
      human[n].position();
      human[n].show();
    }
  } else {
    for (int n = 0; n < many; n++) {       //showing kel
      kel[n].position();
      kel[n].show();
    }
  }
  quit.show();
  randomize.show();
  order.show();
  Taller.show();
  Wider.show();
  Fatter.show();
  order.show();
  change.show();
  raise.show();
  bonus.show();
}

void keyPressed() {        //executing statements if specific buttons is pressed
  if (key == 'r') {
    sHuman();    //randomizing
  }

  if (key == 't') {
    if ( array == true) {            //shifting Taller person to the end
      Taller(human);
    } else if (array == false) {
      Taller(kel);
    }
  }

  if (key == 'b') {      //reseting bird
  }

  if (key == '1') {
    if ( array == true) {          //giving everyone a raise (if 18 or older)
      raise(human);
    } else if (array == false) {
      raise(kel);
    }
  }

  if (key == '2') {            //giving everyone a bonus (if 18 or older)
    if ( array == true) {
      bonus(human);
    } else if (array == false) {
      bonus(kel);
    }
  }

  if (key == '3') {

    if ( array == true) {            //tightenthe human
      array = false;
    } else if (array == false) {
      array = true;
    }
  }

  if (key == 'w') {
    if ( array == true) {            //shifting Wider to the end
      width(human);
    } else if (array == false) {
      width(kel);
    }
  }

  if (key == 'f') {
    if ( array == true) {          //shifting heaviest to the end
      Fatter(human);
    } else if (array == false) {
      Fatter(kel);
    }
  }

  if (key == 'o') {
    if ( array == true) {          //order is defunct
    } else if (array == false) {
    }
  }

  if (key == 'c') {
    cloudB();
  }

  
}

void mousePressed() {    //called when mouse is pressed


  quit.press();
  randomize.press();
  order.press();
  Taller.press();
  Wider.press();
  Fatter.press();
  change.press();
  raise.press();
  bonus.press();

  //executes statement of specific button pressed

  if (bonus.press == true) {
    if ( array == true) {
      bonus(human);
    } else if (array == false) {      //bonus button
      bonus(kel);
    }
  }

  if (raise.press == true) {
    if ( array == true) {            //raise button
      raise(human);
    } else if (array == false) {
      raise(kel);
    }
  }

  if ( change.press == true) {

    if ( array == true) {
      array = false;                //change array button
    } else if (array == false) {
      array = true;
    }
  }

  if ( order.press == true) {
    if ( array == true) {
    } else if (array == false) {      //defunct order button(because each person has their own x and y)
    }
  }

  if ( Taller.press == true) {
    if ( array == true) {
      Taller(human);
    } else if (array == false) {      //Taller button
      Taller(kel);
    }
  }

  if ( Wider.press == true) {
    if ( array == true) {
      width(human);                  //Wider button
    } else if (array == false) {
      width(kel);
    }
  }

  if ( Fatter.press == true) {
    if ( array == true) {
      Fatter(human);
    } else if (array == false) {      //Fatter button
      Fatter(kel);
    }
  }

  if ( randomize.press == true) {      //randomize button
    sHuman();
  }

  if (quit.press == true) {        //exit button
    exit();
  }
}


void order(Person[] a) {       //order routine that does not work, winds up bumping loops of human in a circle
  boolean copy = true;
  int apos, bpos;

  for (int n = 0; n < a.length - 1; n++) {
    if (a[n].h > a[n+1].h) {
      copy = false;
      apos = n;
      bpos = n+1;
      swapping(human, apos, bpos);
    }
  }


  if (copy != false) {
    order(a);
  }
}

void raise(Person a[]) {
  for (int n = 0; n < a.length; n++) {    //raise routine
    if ( a[n].salary < 25000) {         //a person with 25k or less  will get a 5% raise 4 times
      a[n].salary *= 1.05;
    }
    if ( a[n].salary < 50000) {         //a person with 25k - 50k will get a 5% raise 3 times
      a[n].salary *= 1.05;
    }
    if (a[n].salary < 75000) {          //a person with 50k - 75k will get a 5% raise twice
      a[n].salary *= 1.05;
    }
    if (a[n].salary < 1000000000) {      //a person with more than 75k will get a 5% raise up until a billion dollars
      a[n].salary *= 1.05;
    }
  }
}

void bonus(Person a[]) {
  for (int n = 0; n < a.length; n ++) {      //gives everyone $3000 to their salary
    if (a[n].age >= 18) {
      a[n].salary += 3000;
    }
  }
}
void numbers() {
  if ( array == true) {
    averages(human);        //this displays averages
    averagingg(human);
  } else if (array == false) {    
    averages(kel);        //this displays averages
    averagingg(kel);
  }
}


void averagingg(Person a[]) {   //calculating average weight
  float average = 0;
  for (int n = 0; n < a.length; n++) {
    average += a[n].weight;
  }
  average = int(average / a.length);
  text("Average weight : " + average + "lbs", 590, horizon- 270);  //displaying w.a
}

void averages(Person a[]) {      //calculating average height
  int feet, inches;
  float average = 0;
  for (int n = 0; n < a.length; n++) {
    average += a[n].h;
  }
  average = (average / a.length);
  feet = int(average/12);
  inches = int(average%12);
  text("Average height : " + feet + "'" + inches + "''", 590, horizon-285);    //displaying h.a
}


void swap(Person[] c, int a, int b) {    //swap function, needs array and array index of two persons, then switches their postitions  
  float stay;

  stay = c[a].x;
  c[a].x = c[b].x;
  c[b].x = stay;
}


void swapping(Person[] c, int a, int b) {  //swapping was for order which does not work
  int stay;

  stay = a;
  c[a] = c[a+1];
  c[b] = c[b-1];
}

void Taller(Person[] a) {

  float big = 0;
  int pos = 0;
  float position = 0;
  int xpos = 0;

  for (int n = 0; n < a.length; n ++) {    //finding Taller person

    if ( position < a[n].x) {
      position = a[n].x;
      xpos = n;                  //remembers position of current person
    }

    if (big < a[n].h) {
      big = a[n].h;          //rembers the index of Taller
      pos = n;
    }
  }

  swap(a, pos, xpos); //using swap to send the Taller to the end
}


void Fatter(Person[] a) { //finding heaviest person

  float big = 0;
  int pos = 0;
  float position = 0;
  int xpos = 0;

  for (int n = 0; n < a.length; n ++) {  

    if ( position < a[n].x) {        //remembers current person's position
      position = a[n].x;
      xpos = n;
    }

    if (big < a[n].weight) {      //remembers the index of the heaviest
      big = a[n].weight;
      pos = n;
    }
  }

  swap(a, pos, xpos);    //swaps the heaviest to the end
}

void width(Person[] a) { //finding Wider person

  float big = 0;
  int pos = 0;
  float position = 0;
  int xpos = 0;

  for (int n = 0; n < a.length; n ++) {    

    if ( position < a[n].x) {            //current position of person n
      position = a[n].x;
      xpos = n;
    }

    if (big < a[n].w) {        ///remembers index of Wider
      big = a[n].w;
      pos = n;
    }
  }

  swap(a, pos, xpos);    //swaps Wider to the end
}

class Person {

  float r, g, b;     //colors
  float w1, w2;    // width
  float h1, h2;    //height
  float w, h;       //width and height
  float x, y;       //x,y position

  int feet, inches;
  int weight;
  int age;
  int salary;

  String name;

  Person() {
    r = random(0, 255);          //randomizing
    g = random(0, 255);
    b = random(0, 255);

    name = names[int(random(0, names.length))];
  }

  Person(float rr, float gg, float bb, String kk) {    //People constructor that gets color and name
    r = rr; 
    g = gg; 
    b = bb; 
    name = kk;
  }

  void startup() {

    age = int(random(1, 99.5));              //age between 1 and 99
    salary = int(random(1000, 100000.5));    //salary between 1,000 and 100,000

    w1 = random(miniW/2, maxW/2);    //width and height 
    w2 = random(miniW/2, maxW/2);    

    h1 = random(miniH/2, maxH/2);    
    h2 = random(miniH/2, maxH/2);

    w = w1 + w2;  //curve result
    h = h1 + h2;
  }

  void position() {
    y = horizon - (h/2);  //y position
  }

  void body() {
    noStroke();
    fill(r, g, b);
    rectMode(CENTER);
    rect(x, y, w, h);      //body
    ellipse(x, (y - (h/2) - (h/6)), w, h/3);  //head
  }

  void show() {
    body();
    info();
    messages();
  }

  void info() { 
    feet = int((h/12));      //height
    inches = int(h % 12);
    feet -= 4;
    weight = int(((2 * h) * w)/50);  //weight dependenxy
  }

  void messages() {
    textSize(12);
    text(name, x - w/2, y + h/2 + 25);                          // name
    text(feet + "'" + inches + "''", x - w/2, y + h/2 + 40);     //height
    text(weight + "lbs", x- w/2, y + h/2 + 55);                // weight
    text("$" + salary, x - w/2, y + h/2 +70);                   // salary
    if (age < 18) {
      salary = 0;    //setting salary to zero if less than 18
    }
    text( age, x - w/2, y + h/2 +85);                           //age
  }
}

class Cloud {
  float x, y;
  float w;


  Cloud(float ww, float xx, float yy) {   //constructor
    w = ww;
    x = xx;
    y = yy;
  }

  void movement() {   //moves left and resets when off the screen
    x +=1;
    if (x-500>width) {    
      cloudB();
    }
  }

  void show() {
    fill(255);    //color and shape cloud
    ellipse(x, y, w, w/2);
  }
}

class Button {
  boolean press;
  float x, y;      //button has name, position, and boolean of press

  String name;


  Button(float b, float c, String a) {    //constructor 
    name = a;
    x = b;
    y = c;
  } 
  void press() {
    if ( dist(mouseX, mouseY, x, y) < 25 && mousePressed) {   //finding if button is pressed
      press = true;
    } else {
      press = false;
    }
  }

  void show() {

    if ( dist(mouseX, mouseY, x, y) < 25) {
    }

    fill(255);
    rectMode(CENTER);      //shape of buttons
    rect(x, y, 55, 55);  //rim of button 
    fill(0);
    text( name, x - 20, y+2);  //displaying name on button
  }
}
void messages() {      //title
  fill(0);
  textSize(20);
  text("Project 5", 20, 30);
  textSize(12);

  textSize(12);
  text("Press any of the buttons to do their actions", 50, 80);       //controls
  text("Press 't' to move taller to the end", 50, 100);
  text("Press 'w' to move wider to the end", 50, 120);
  text("Press 'f' to move Fatter to the end", 50, 140);
  text("Press 'r' to randomize human", 50, 160);
  text("Press 'q' to quit", 50, 180);
  text("Press 'c' to reset clouds", 50, 200);
  
  
  textSize(20);
  String b = "Kelly Hernandez.";
  text( b, width/2, height/16);      //summary
}
