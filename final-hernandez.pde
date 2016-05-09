//Kelly Hernandez CST112
//Project 5 
//array of people

float k, y; 


float stand;
int spacing=100;
int many=8;

float sky;
float cloudX = 100, cloudY = 50;
float mCloud = 1;
float nCloud=8;

String title= "Project 5";
String subtitle=  "Press 't' key to move tallest to end.";
String author=  "Kelly Hernandez, CST112";



Person [] human = new Person [many];
//SETUP: define screen size//
void setup() {
  size (700, 400 );
  
  k = 0;
  y = 0;   
  stand = height/1.2;
  //--??  human= new Person (); 
  reset();
}


void reset() {
  for (int i=0; i<many; i+=1) {
    human[i]=new Person ();
  }
}


//DRAW: sky, ground, house, tree, sun//
void draw() {
  background (48, 220, 200);          //sky color
  scene();

  cloud();
  message();
  // Show all human.
  k=50;
  y=stand;
  for (int i=0; i<many; i++) {
    human[i].show( k, y );
    k=  k + 70;
  }
} 

//SCENE:
void scene() {           

  
  stroke(0);
  fill(100, 220, 50);  //color of ground
  rect ( 0, stand, width, height-stand );    //ground
  
} 

//MESSAGES: title and author 
void message() {
  fill (0);
  textSize(20);
  text (title, width/3, 20 );
  textSize(12);
  text (subtitle, width/3, 30 );
  text (author, 10, height -10 );
  text( "Press 'r' key to reset.", 250, height-350 );
  text( "Press 'q' key to quit.", 250, height-330 );
  fill(0);
  text( "Height", 2, 355 );
text( "Width", 2, 378 );
}

//// EVENT HANDLERS
void keyPressed() {
  if (key == 'q') exit();
  if (key == 'r') reset();
  if (key == 't') tall( human, many );
}

void cloud() {
  fill(255, 255, 255);

  float tempX = cloudX, tempY = cloudY, tempW = 60, tempH = 25;

  for (int j=0; j < nCloud; j+=1) {  // Loop forthe clouds
    ellipse(tempX, tempY, tempW, tempH);
    tempX = tempX - tempW;
    tempY = tempY + tempH;
    tempW *= 0.7;  //last two clouds
    tempH *= 0.7;
  }
  cloudX = cloudX + mCloud;   // Movement cloud

  if (cloudX > width + 200) {  // Resets cloud at a random height
    cloudX = 0;
    cloudY = random(0, sky);
    nCloud = random(1, 8);
  }
}
//CLASS DEFINITIONS///


void tall( Person[] p, int m ) {
  //// Move tallest to end.
  
  int k=0;
  // Find tallest
  
  for ( int j=0; j<many; j++ ) {
    if (p[j].tall > p[k].tall) {
      k=j;
    }
  }  
  // Move it to end swap elements.// 1 highest one willst one at the end
  Person save;
  save=  p[m-1];
  p[m-1]=  p[k];
  p[k]=  save; 
}



class Person {

  float r=255, g=0, b=0;
  
 

  // float x= random ( 50, 350);
  // float y= random (stand, 250);
  //--int x= 50;
  //--int y= 50;
  int tall= int( random( 50, 200 ) );
  int wide= int( random( 15, 45 ) );
  int num;
 

  // CONSTRUCTOR
  Person() {
    r=  random( 255 );
    g=  random( 130 );
    b=  random( 100 );
    
  }

  //Display human
  void show( float x, float y ) { 
    noStroke(); // stroke for the humans
    fill ( r, g, b );  
    rect ( k, y, wide+5, -tall);
    float xei = tall/6;
    ellipse( x+wide/2, y-tall-xei/2, xei, xei*3/4 );
  

 numeric( k, y );
  }
void numeric( float k, float y ) {
    // Name

    

    text( int(tall), k, y+30 );
    text( int(wide), k, y+50 );
                  
 
  }
  }
