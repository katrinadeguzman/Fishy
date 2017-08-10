/*
//Katrina de Guzman 301251006 IAT 167 E103
//Fishing!
//
//Catch the fish!
//Don't touch the squid and jellyfish!
//
*/




//declare new objects
Player p; 
Hook h;               
Worm bait;            
Jellyfish j;         
Squid s;             
Health health;         

//declare new array of fish objects
ArrayList<Fish> fishes = new ArrayList<Fish>();  
int numFish; //number of fish

int numWorm; //number of worms

int maxHealth = 10; //maximum health
int maxScore = 15;  //maximum score


//level states
int state;

final int LEVEL_ONE = 0;
final int LEVEL_TWO = 1;

final int WON = 2;
final int LOST = 3;


void setup()
{
  size(800, 500);
  background();

  playSound(OCEAN);//ocean sounds!

  //for the text
  scoreFont = loadFont("VinerHandITC-48.vlw");
  textFont(scoreFont);

  //extra details...
  imageMode(CENTER);
  ellipseMode(CENTER);
  smooth();

  //initialize each object
  health = new Health(new PVector(550, 400));
  bait = new Worm(new PVector(600, 480));
  h = new Hook(new PVector(width/2, 130), new PVector());
  j = new Jellyfish(new PVector(0, 420), new PVector(random(-1, -2), random(-1, 1)));
  s = new Squid(new PVector(0, 350), new PVector(random(1, 1), random(-1, 1)));
  p = new Player(new PVector(width/2, 90), new PVector());

  //initial level state
  states(LEVEL_ONE);
}

void states(int state) //level state
{
  switch(state) 
  {
  case LEVEL_ONE:
    level(6, 3); //level one starts with 6 fish, and 3 worms
    break;
  case LEVEL_TWO:
    level(10, 10);
    break;
  case WON:
    yay();
    break;
  case LOST:
    boo();
    break;
  }
}

void level(int noFish, int noWorm) //each level can start with a different number of fish and bait
{

  for (int i = 0; i < noFish; i++)
  {
    fishes.add(new Fish(new PVector(random(width), int(random(180, height))), new PVector(random(-3, 0), random(-3, 3))));
  }
  numWorm = noWorm;
  numFish = noFish;
}

void draw()
{

  image(backgroundImg, width/2, height/2); //background

  if(frameCount < 360) //intro text disappears after 6 seconds!
  {
    howTo();
  }
  
  keyboard(); //calls keyboard control for player

  //updates:
  p.update(); //player object
  wave();     //small wave below the player's boat!
  h.update(); //hook object
  printScore(); //prints score

    if (score == numFish) //if all fish caught in level one, move on to level two
  {
    states(LEVEL_TWO);
  }

  if (score > 5) //when in level two, add enemies
  {
    s.update();
    j.update();
  }

  if (score >= maxScore) //when highscore is reached, you win!
  {
    stop();
    states(WON);
  }

  //update objects
  for (int i = 0; i < fishes.size (); i++) 
  {
    Fish f = fishes.get(i); //iterates through fish array, and updates each one
    f.update();

    if (h.collision(f) && numWorm > 0) //fish caught!
    {   
      f.vel.x = 0;  //stay on hook
      f.vel.y = 0;
      f.pos.x = h.pos.x+20;
      f.pos.y = h.pos.y+15;

      if (f.pos.y == 145 && (frameCount % 60 == 0)) //must bring hook above water, and wait a second!
      {
        //removes fish, increases score, and subtracts a worm
        fishes.remove(f); 
        score++;
        numWorm--;
      } 

      if (numWorm <= 0) //cannot have negative amount of worms
      {
        numWorm = 0;
      }
    }
  }

  if (s.collision(h)) //squid collides with hook?
  {
    s.inked(); //squirt ink!
  }

  if (score == (numFish/2)) //more bait halfway through level
  {
    bait.update();

    if (bait.collision(h)) //collect it with your hook
    {
      numWorm = 3;
      bait.pos.y = height;
      bait.pos.x = 0;
    }
  }

  if (p.health <= maxHealth/2) //the first time player's health reaches below half of initial health
  {
    health.update(); //more health!

    if (health.collision(h)) //collect with hook
    {
      p.health = maxHealth;
      health.pos.y = height;
      health.pos.x = 0;
    }
  }
  water();    //blue tint over the animals, for an underwater effect
  drawHealthBar();
}

