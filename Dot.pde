class Dot extends MovingObject
{
  /*
  //Creates the ink objects that comes out of the squid, when the squid comes in contact with the hook.
  //Ink dots are not harmful to the player or fish, it only creates a cloudy effect.
  */
  
  float damp; //slows it down

  int life = 20; //to measure how long the ink dots stay on screen

  Dot(PVector pos, PVector vel) 
  {
    super(pos, vel);
    dim = new PVector(1, 1);
    damp = 1;
  }

  void update(ArrayList list) //updates ink array
  {
    move();
    handleWalls();
    render();
    if (life == 0) 
    {
      list.remove(this);
    } 
    life--;
  }

  void move() 
  {
    super.move();
    vel.mult(damp);
  }

  void render() 
  {
    pushMatrix();
    int diam = int(random(10));
    fill(0);
    ellipse(pos.x, pos.y, diam, diam );
    popMatrix();
  }

  void accelerate(PVector force) 
  {
    vel.add(force);
  }

  void handleWalls() 
  {
    if (abs(pos.x-width/2) > width/2 || abs(pos.y-height/2) > height/2) 
    {
      life = 0; //when we go offscreen, set life to 0 and we'll remove the particle from the list next call to update
    }
  }
}

