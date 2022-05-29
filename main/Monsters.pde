public class Monsters{
  float x, y, dx, dy;
  //boolean status;
  int attackSpeed;

  public Monsters(float x_, float y_, int attackSpeed_){
    x = x_;
    y = y_;
    attackSpeed = attackSpeed_;
    dx = 0; 
    dy = 0; 
  }

  void display(){
    imageMode(CENTER);
    image(monsterIm, x, y, monsterIm.width/5, monsterIm.height/5);
    
    text("monster's width= " + monsterIm.width/5, 80, 120);
    text("monster's height= " + monsterIm.height/5, 80, 130);
    text("monster's x= " + x, 80, 140);
    text("monster's y= " + y, 80, 150);
  }
  
  void attack(Doodle d){
    if(dist(x, y, d.x, d.y) <= 100){
      d.injure();
    }
  }
  
  void monsMove(){}
  
  void monsDrop(){}
  
  //void monsAttract(){}
  
  
}
