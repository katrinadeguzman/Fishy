class Worm extends Bonus
{
  /*
  //A bonus object!
  //Increases the amount of bait you have after collecting it!
  */
  
  Worm(PVector pos) 
  {
    super(pos);
    dim = new PVector(40, 40);
    img = loadImage("worm.png");
  }
  void render() 
  {
    pushMatrix();
    translate(pos.x, pos.y);
    image(img, -img.width/2, -img.height/2);
    popMatrix();
  }
}

