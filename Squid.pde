class Squid extends MovingObject
{
  /*
  //An obstacle. The ink it creates affects the visibility of the surrounding objects.
  //Harmless.
  */
  
  int currentFrame = 0;
  PImage[] swimming = new PImage[2];
  ArrayList<Dot> dots = new ArrayList<Dot>(); //array for ink dots!

  Squid(PVector pos, PVector vel)
  {
    super(pos,vel);
    dim = new PVector(40, 40);
    for (int i = 0; i < swimming.length; i++) 
    {
      swimming[i] = loadImage("squid_" + i + ".png");
    }
  }

  void handleWalls() //wrap around!
  {
    if (pos.x + dim.x/2 < 0)
    {
      pos.x = width + dim.x/2;
    }
    if (pos.x-dim.x/2 > width)
    {
      pos.x = -dim.x/2;
    }
    if (pos.y -dim.y/2 < 150)
    {
      vel.y = -vel.y;
    }
    if (pos.y + dim.y/2 > height)
    {
      vel.y = -vel.y;
    }
  }

  boolean collision(Hook other) //touch hook?
  {
    return abs(pos.x+20 - h.pos.x) < dim.x/2 + h.dim.x/2 && abs(other.pos.y-pos.y) < dim.y/2 + h.dim.y/2;
  }

  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);

    if (frameCount % 5 == 0) 
    {
      currentFrame++;
      if (currentFrame == swimming.length) //swimming squid!
      {
        currentFrame = 0;
      }
    }
    PImage img = swimming[currentFrame];
    image(img, 0, 0);
 
    popMatrix();
  }

  void inked()
  {
    for (int i=0; i  < 5; i++) 
    {
      dots.add(new Dot(new PVector(s.pos.x, s.pos.y), new PVector(5*cos(random(TWO_PI)), 5*sin(random(TWO_PI))))); //squirt ink!!
    }   

    for (int i=0; i < dots.size (); i++) 
    {
      Dot d = dots.get(i);
      d.update(dots);
    }
  }
}

