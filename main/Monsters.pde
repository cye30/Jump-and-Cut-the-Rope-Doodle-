public class Monsters{
  float x, y, dx, dy;
  //boolean status;
  int attackSpeed;

  public Monsters(float x_, float y_, int attackSpeed_){
    x = x_;
    y = y_;
    attackSpeed = attackSpeed_;
    dx = 2; 
    dy = 0; 
  }

  void display(){
    imageMode(CENTER);
    image(monsterIm, x, y, monsterIm.width/5, monsterIm.height/5);
    noFill(); //for testing purposes
    circle(x, y, 100);
    
    text("monster's width= " + monsterIm.width/5, 50, 140);
    text("monster's height= " + monsterIm.height/5, 50, 130);
    text("monster's x= " + x, 50, 160);
    text("monster's y= " + y, 50, 150);
  }
  
  void attack(Doodle d){
    if(dist(x, y, d.x, d.y) <= 100){
      d.injure();
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
