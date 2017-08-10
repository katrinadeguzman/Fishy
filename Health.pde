class Health extends Bonus
{
  /*
  //A heart shaped object, that when collected, restores the player's health!
  */
  
  Health(PVector pos) 
  {
    super(pos);
    dim = new PVector(20, 20);
    img = loadImage("health.png");
  }
 
  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    scale(0.3);
    println(pos.x, pos.y, mouseX, mouseY);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
}

