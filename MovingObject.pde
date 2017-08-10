class MovingObject
{/*
  //Contains basic code for the movement of enemies, player, and fish!
  */
  PVector pos, vel, dim;
  
  MovingObject(PVector pos, PVector vel)
  {
    this.pos = pos;
    this.vel = vel;
    dim = new PVector();
  }
  
  void move()//change position!
  {
    pos.add(vel);
  }
  
  void update()//update everything!
  {
    render();
    move();
    handleWalls();
  }
  void render()//draw object
  {
    
  }
  
  void handleWalls()
  {
  }
  
  boolean collision(MovingObject other) //hit detection
  {
    return abs(pos.x - other.pos.x ) < dim.x/2 + other.dim.x/2 && abs(other.pos.y-pos.y) < dim.y/2 + other.dim.y/2;
  }
  
  
}
