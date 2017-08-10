
/*
  //Contains global variables and other details...
 */

//sound 
import ddf.minim.spi.*;
import ddf.minim.signals.*;
import ddf.minim.*;
import ddf.minim.analysis.*;
import ddf.minim.ugens.*;
import ddf.minim.effects.*;
Minim m = new Minim(this);
final String OCEAN = "ocean.wav";  //sound effect from freesound.org
AudioPlayer sound;
void playSound(String file) 
{
  sound=m.loadFile(file, 2048);
  sound.play();
}
//- ADAPTED from IAT 167 sample_labComplete


//keyboard controls!
boolean up, down, left, right;
PVector upForce = new PVector(0, -1);
PVector downForce = new PVector(0, 1);
PVector leftForce = new PVector(-1, 0);
PVector rightForce = new PVector(1, 0);

void keyPressed() 
{
  if (key == 'W' || key == 'w' || (key == CODED && keyCode == UP)) up = true;

  if (key == 'A' || key == 'a' || (key == CODED && keyCode == LEFT)) left = true;

  if (key == 'S' || key == 's' || (key == CODED && keyCode == DOWN)) down = true;

  if (key == 'D' || key == 'd' || (key == CODED && keyCode == RIGHT)) right = true;
}

void keyReleased() 
{
  if (key == 'W' || key == 'w' || (key == CODED && keyCode == UP)) up = false;

  if (key == 'A' || key == 'a' || (key == CODED && keyCode == LEFT)) left = false;

  if (key == 'S' || key == 's' || (key == CODED && keyCode == DOWN)) down = false;

  if (key == 'D' || key == 'd' || (key == CODED && keyCode == RIGHT)) right = false;
}
void keyboard()
{
  //keyboard control!
  if (left) p.accelerate(leftForce);
  if (right) p.accelerate(rightForce);
  if (left) h.accelerate(leftForce);
  if (right) h.accelerate(rightForce);
  if (up) h.accelerate(upForce);
  if (down) h.accelerate(downForce);
}


//water effects
int wave;
int dwave = 1;

void wave()
{
  //water below boat!
  pushMatrix();
  translate(p.pos.x, p.pos.y);
  scale(0.6);
  stroke(8, 179, 255);
  strokeWeight(5);
  fill(8, 179, 255);
  bezier(-95, 102, -30, 95 - wave, 0, 70 + wave, 95, 105);
  noStroke();
  fill(8, 179, 255);
  popMatrix();

  wave += dwave;
  if (wave == 40)
  {
    dwave = -dwave;
  }
  if (wave == -30)
  {
    dwave = -dwave;
  }
}

void water()
{
  //blue tint over all objects in ocean!
  rectMode(CORNERS);
  fill(8, 179, 255, 100);
  noStroke();
  rect(0, 150, width, height);
}

//text font
int score;
PFont scoreFont;

//on screen text
void printScore()
{
  fill(136, 69, 19);
  textSize(20);
  text("Fish caught:" + score, 660, 20);
  text("Worms left:" + numWorm, 665, 40);
}

void yay()
{
  fill(136, 69, 19);
  textSize(50);
  text("YOU WON", 275, 300);
  stop();
}

void boo()
{
  fill(136, 69, 19);
  textSize(50);
  text("GAME OVER", 275, 300);
  stop();
}

void howTo()
{
  fill(136, 69, 19);
  textSize(25);
  text("             Catch all the fish! \n Do not touch the squid and jellyfish! \n              Use the arrow keys! ", 205, 275);
  
}

//player's health
void drawHealthBar() 
{
  int max = 200;
  pushMatrix();
  //translate(100, 10);
  rectMode(CORNER);
  fill(255, 0, 0);
  float playerHealthRatio = ((float) p.health / maxHealth); 
  rect(0, height-15, (max*playerHealthRatio)*2, 15); 
  popMatrix();
  if (p.health <= 0)
  {
    boo();
  }
}

//game background
PImage backgroundImg;
void background()
{
  backgroundImg  = loadImage("background.png");
}

