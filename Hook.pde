class Hook extends MovingObject
{  
  /*
  //The hook at the end of the player's fishing rod. Control with the arrow keys
  //to catch fish!
  //Try to avoid the jellyfish!
  */
  
  float damp; //slows it down
  PImage hook = loadImage("hook_1.png");
  PImage hook1= loadImage("hook_0.png");

  Hook(PVector pos, PVector vel) 
  {
    super(pos, vel);
    dim = new PVector(10, 10);
    damp = 0.8;
  }

  void move() 
  {
    super.move();
    vel.mult(damp);
  }

  void handleWalls() //stay on screen at all times
  {
    if (pos.x + p.dim.x/2 > width) 
    {
      pos.x = width - p.dim.x/2;
    }
    if (pos.x - p.dim.x/2 < 0) 
    {
      pos.x = p.dim.x/2;
    }
    if (pos.y < 130)
    {
      pos.y = 130;
    }
    if (pos.y> height)
    {
      pos.y = height;
    }
  }

  void accelerate(PVector force) 
  {
    vel.add(force);
  }

  boolean collision(Fish other) //hit fish?
  {
    return abs(pos.x - other.pos.x) < dim.x/2 + other.dim.x/2 && abs(other.pos.y-pos.y) < dim.y/2 + other.dim.y/2;
  }

  boolean collision(Jellyfish other) //hit jellyfish?
  {
    return abs(j.pos.x - (pos.x+30)) < j.dim.x/2 + dim.x/2 && abs(j.pos.y) < pos.y+60 + dim.y/2 + j.dim.y/2 ;
  }

  void render() 
  {

    pushMatrix();
    translate(pos.x-55, pos.y+5);
    scale(-1, 1);
    scale(0.25);

    if (numWorm > 0)
    {
      image(hook, -hook.width/2, -hook.height/2);
    } else if (numWorm == 0)
    {
      image(hook1, -hook1.width/2, -hook1.height/2);
    }

    popMatrix();
    
    if (h.collision(j)) //electrocution effect!
    {
      float val = 255 - (frameCount%2*255); //flicker effect when hit!
      stroke(val, val, 255);
      strokeWeight(4);
      if (frameCount%10 == 0)
      {
        p.health--; //touching jellyfish affects your health
      }
    } else
    {
      stroke(0);
      strokeWeight(1);
    }
    line(p.pos.x - 30, p.pos.y, this.pos.x - 30, this.pos.y-30);
  }
}

