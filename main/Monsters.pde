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
    image(monsterIm, x, y, monsterIm.width/4, monsterIm.height/4);
    
    text("monster's width= " + monsterIm.width/4, 100, 220);
    text("monster's height= " + monsterIm.height/4, 100, 230);
    text("monster's x= " + x, 100, 240);
    text("monster's y= " + y, 100, 250);
  }
  
  void attack(Doodle d){
    if(dist(x, y, d.x, d.y) <= 125){
      d.injure();
    }
  }
  
  void monsMove(){}
  
  void monsDrop(){}
  
  //void monsAttract(){}
  
  
}
