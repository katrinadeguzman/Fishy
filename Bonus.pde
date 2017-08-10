class Bonus
{
  /*
  //Contains basic code for the positioning and collecting of bonus objects!
  */
  
  PVector pos, dim; //position, velocity, dimensions!
  PImage img;       //image of bonus object
  
  Bonus(PVector pos)//constructor
  {
    this.pos = pos;
    dim = new PVector();
  }
  
  void update()
  {
    render();
  }
  
  boolean collision(Hook other) //check if touched by hook
  {
    return abs(pos.x - h.pos.x) < dim.x/2 + h.dim.x/2 && abs(h.pos.y-pos.y) < dim.y/2 + h.dim.y/2;
 
  }
  
  void render()//draw object
  {
  }
}
