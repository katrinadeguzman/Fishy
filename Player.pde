class Player extends MovingObject
{
  /*
  //Player object controlled by you!
  //Catches fish, earns points, and attacked by jellyfish!
  */
  
  float damp; //slows it down
  PImage playerImg;
  int health;

  Player(PVector pos, PVector vel) 
  {
    super(pos,vel);
    dim = new PVector(120, 120);
    damp = 0.8;
    playerImg = loadImage("player.png");
    health = 10;
  }

  void move() 
  {
    super.move();
    vel.mult(damp);
  }

  void handleWalls() //stay on screen at all times!
  {
    if (pos.x + dim.x/2 > width) 
    {
      pos.x = width - dim.x/2;
    }
    if (pos.x - dim.x/2 < 0) 
    {
      pos.x = dim.x/2;
    }
  }

  void accelerate(PVector force) //moves you
  {
    vel.add(force);
  }

  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    image(playerImg, 0, 0);

    //rod
    stroke(0);
    strokeWeight(1);
    stroke(170, 122, 0);
    strokeWeight(5);
    line(40, 10, -30, 0);
    popMatrix();
  }
}

