class Jellyfish extends MovingObject
{
  /*
  //An enemy to the player!
  //Moves randomly through the screen, and damages player's health
  //if it touches your hook, or line!
  */
  
  int currentFrame = 0;
  PImage[] swimming = new PImage[9];  //an array of jellyfish images!

  Jellyfish(PVector pos, PVector vel) 
  {
    super(pos, vel);
    dim = new PVector(40, 40);

    for (int i = 0; i < swimming.length; i++) 
    {
      swimming[i] = loadImage("jelly_" + i + ".png");
    }
  }

  void handleWalls() //wrap around!
  {
    if (pos.x + dim.x/2  < 0)
    {
      pos.x = width + dim.x/2;
    }
    if (pos.x-dim.x/2 > width)
    {
      pos.x = -dim.x/2;
    }
    if (pos.y -dim.y/2 < 225)
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

    if (frameCount % 5 == 0) 
    {
      currentFrame++;
      if (currentFrame == swimming.length) //jellyfish floats around!
      {
        currentFrame = 0;
      }
    }
    PImage img = swimming[currentFrame];
    image(img, -img.width/2, -img.height/2);

    popMatrix();
  }
}

