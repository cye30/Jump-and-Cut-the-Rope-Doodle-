public class Monsters{
  float x, y, dx, dy;
  //boolean status;
  int attackSpeed;
  float monsStartX; //for organizational purposes
  float monsStartY = 560; //for organizational purposes
  ArrayList<float[]> bullet = new ArrayList<float[]>(); //0=bx,1=by,2=br,3=bdy

  int countDown=30;

  public Monsters(float x_, float y_, int attackSpeed_){
    x = x_;
    y = y_;
    monsStartX = x_;
    monsStartY = y_;
    attackSpeed = attackSpeed_;
    dx = 2; 
    dy = 0; 
  }

  void display(PImage im){
    imageMode(CENTER);
    image(im, x, y, im.width/5, im.height/5);
    //noFill(); //for testing purposes
    //circle(x, y, 100);
    
  }
  
  void attack(Doodle d){
    if(dist(x, y, d.x, d.y) <= 100){
      d.injure();
    }
  }
  
  void shoot(float x_, float y_, float bdy_){
    countDown--;
    if(countDown ==0){
      bullet.add(new float[] {x_, y_, 7, bdy_});
      countDown =30;
    }
    
    for(int i=0; i<bullet.size(); i++){
      bullet.get(i)[1] += bdy_;//moves the bullet vertically
      circle(bullet.get(i)[0], bullet.get(i)[1], bullet.get(i)[2]);//draw the bullet
    }
  }
  
  void monsMove(){
    if(x >= 567 && dx > 0) {
      dx = -2;
    }else if(x < 33 && dx < 0){
      dx = 2;
    }
    x += dx;
  }
  
  void monsDrop(){}
  
  //void monsAttract(){}
  
  
}
