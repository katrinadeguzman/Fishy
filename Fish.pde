class Fish extends MovingObject
{
  /*
  //Fish objects that are to be caught in order to progress through the game.
  */
  
  int currentFrame = 0;
  PImage[] swimming = new PImage[2]; //array of fish images

  Fish(PVector pos, PVector vel) 
  {
    super(pos, vel);
    dim = new PVector(40, 40);    
    for (int i = 0; i < swimming.length; i++) 
    {
      swimming[i] = loadImage("fish_" + i + ".png");
    }
  }

//  boolean collision(Dot other) 
//  {
//    return abs(pos.x - other.pos.x) < dim.x/2 + other.dim.x/2 && abs(other.pos.y-pos.y) < dim.y/2 + other.dim.y/2;
//  }

  void handleWalls() //wrap around
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

  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.25);

    if (frameCount % 5 == 0) //animates a swimming fish!
    {
      currentFrame++;
      if (currentFrame == swimming.length)
      {
        currentFrame = 0;
      }
    }
    PImage img = swimming[currentFrame];
    image(img, -img.width/2, -img.height/2);

    popMatrix();
  }
}

