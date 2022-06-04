public class Sprinkle{
  float x,y,dx,dy;
  
  public Sprinkle(float x_, float y_, float dx_){
    x=x_;
    y=y_;
    dx=dx_;
    dy= -20;
  }
  
  void gravity(){
    dy += .8;
  }
  
  void move(){
   y += dy;
   x += dx;
  }
  
  void display(){
    imageMode(CENTER);
    image(starImg, x, y, starImg.width/90, starImg.height/90);
  }

}
