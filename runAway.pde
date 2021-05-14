//ART 199 
//3/16/2017
//This app is a game I created called Run Away. The home screen was designed to create
//the facade of fear, but due to the fact that I wanted to create something odd and
//playful, each button you click takes you to a level that tackles an obscure and unusual 
//fear. The screen is populated by people running away from the object of that specific 
//fear. If you swipe over them, they are consumed by the fear and a counter in the top 
//right corner will keep track of the number of people consumed. The fears addressed in 
//this game are fear of beards, fear of balloons, fear of navel, and fear of the Pope.
//Enjoy!

float x = 600;
float y = 400;
int count = 150;
float []xs = new float [count];
float []ys = new float [count];
float easing = -0.01;
PImage person;
PImage beard;
PImage beardbackground;
PImage navel;
PImage bellybackground;
PImage balloons;
PImage balloonsbackground;
PImage pope;
PImage popebackground;
PImage fear;
PImage home;
int consumed = 0;
boolean state = true;
boolean beardstate = false;
boolean navelstate = false;
boolean balloonstate = false;
boolean popestate;
PFont chalkduster;


void setup() {
  size(1200, 800);
  chalkduster = loadFont("Chalkduster.vlw");
  textFont(chalkduster, 48);

  home = loadImage("home.png");
  fear = loadImage("fear.jpg");
  person = loadImage("regularhuman.png");
  beardbackground = loadImage("beardbackground.jpg");
  bellybackground = loadImage("belly.jpg");
  balloonsbackground = loadImage("balloonsbackground.jpg");
  popebackground = loadImage("popebackground.jpg");
  
  noStroke();
  beard = loadImage("beard.png");
  navel = loadImage("navel.png");
  balloons = loadImage("balloons.png");
  pope = loadImage("pope.gif");

  for (int i=0; i<count; i++) {
    xs[i] = random(50, 1150);
    ys[i] = random(50, 750);
  }
}

void draw() {
  background(fear);

  if (state == true) {
    cursor();
    noStroke();
    fill(149, 2, 2, 120);
    rect(200, 200, 200, 120, 5);
    rect(800, 200, 200, 120, 5);
    rect(200, 600, 200, 120, 5);
    rect(800, 600, 200, 120, 5);

    fill(0);
    textAlign(CENTER, CENTER);
    textSize(48);
    text("RUN AWAY!", 600, 50);

    pushMatrix();
    fill(255);
    textSize(32);
    text("Choose a Phobia", width/2, height/2 + 50);
    popMatrix();

    pushMatrix();
    fill(255);
    textSize(22);
    //Fear of beards
    text("Pogonophobia", 300, 260);
    //Fear of balloons
    text("Globophobia", 900, 260);
    //Fear of navel
    text("Omphalophobia", 300, 660);
    //Fear of the Pope
    text("Papaphobia", 900, 660);
    popMatrix();
  }

  if (beardstate == true) {
    background(beardbackground);
    noCursor();
    imageMode(CENTER);
    image(beard, mouseX, mouseY);
    
    textSize(24);
    text("People Consumed: " + consumed, 1000, 50);
    
    image(home, 50, 50);

    for (int i=0; i<count; i++) {
      float targetX = mouseX;
      float dx = targetX - xs[i];
      xs[i] += dx * easing;

      float targetY = mouseY;
      float dy = targetY - ys[i];
      ys[i] += dy * easing;

      if (dist(mouseX, mouseY, xs[i], ys[i])<50) {
        xs[i] = 5000;
        ys[i] = 3000;
        consumed++;
      }
      image(person, xs[i], ys[i], person.width/2, person.height/2);
    }
  }
    
  else if (navelstate == true) {
    background(bellybackground);
    noCursor();
    imageMode(CENTER);
    image(navel, mouseX, mouseY);
    
    pushMatrix();
    fill(0);
    textSize(24);
    text("People Consumed: " + consumed, 1000, 50);
    popMatrix();
    
    image(home, 50, 50);
    

    for (int i=0; i<count; i++) {
      float targetX = mouseX;
      float dx = targetX - xs[i];
      xs[i] += dx * easing;

      float targetY = mouseY;
      float dy = targetY - ys[i];
      ys[i] += dy * easing;

      if (dist(mouseX, mouseY, xs[i], ys[i])<50) {
        xs[i] = 5000;
        ys[i] = 3000;
        consumed++;
      }
      image(person, xs[i], ys[i], person.width/2, person.height/2);
    }
  }
  else if (balloonstate == true) {
    background(balloonsbackground);
    noCursor();
    imageMode(CENTER);
    image(balloons, mouseX, mouseY);
    
    textSize(24);
    text("People Consumed: " + consumed, 1000, 50);
    
    image(home, 50, 50);

    for (int i=0; i<count; i++) {
      float targetX = mouseX;
      float dx = targetX - xs[i];
      xs[i] += dx * easing;

      float targetY = mouseY;
      float dy = targetY - ys[i];
      ys[i] += dy * easing;

      if (dist(mouseX, mouseY, xs[i], ys[i])<50) {
        xs[i] = 5000;
        ys[i] = 3000;
        consumed++;
      }
      image(person, xs[i], ys[i], person.width/2, person.height/2);
    }
  }
  else if (popestate == true) {
    background(popebackground);
    noCursor();
    imageMode(CENTER);
    image(pope, mouseX, mouseY);
    
    textSize(24);
    text("People Consumed: " + consumed, 1000, 50);
    
    image(home, 50, 50);

    for (int i=0; i<count; i++) {
      float targetX = mouseX;
      float dx = targetX - xs[i];
      xs[i] += dx * easing;

      float targetY = mouseY;
      float dy = targetY - ys[i];
      ys[i] += dy * easing;

      if (dist(mouseX, mouseY, xs[i], ys[i])<50) {
        xs[i] = 5000;
        ys[i] = 3000;
        consumed++;
      }
      image(person, xs[i], ys[i], person.width/2, person.height/2);
    }
  }
}

void mousePressed() {
  //Pogonophobia button
  if (state == true && mouseX>200 && mouseX<200+200 && mouseY>200 && mouseY<200+120) {
    beardstate = true;
    state = false;
  }
  //Omphalophobia button
  if (state == true && mouseX>200 && mouseX<200+200 && mouseY>600 && mouseY<600+120) {
    navelstate = true;
    state = false;
  }
  //Globophobia button
  if (state == true && mouseX>800 && mouseX<800+200 && mouseY>200 && mouseY<200+120) {
    balloonstate = true;
    state = false;
  }
  //Papaphobia button
  if (state == true && mouseX>800 && mouseX<800+200 && mouseY>600 && mouseY<600+120) {
    popestate = true;
    state = false;
  }
  //home button
  if (state == false && mouseX>50 && mouseX<50+50 && mouseY>50 && mouseY<50+50) {
  beardstate = false;
  navelstate = false;
  balloonstate = false;
  popestate = false;
  state = true;
  consumed = 0;
    for (int i=0; i<count; i++) {
      xs[i] = random(50, 1150);
      ys[i] = random(50, 750);
    }
  } 
}