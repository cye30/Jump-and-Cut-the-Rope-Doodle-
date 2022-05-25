public class Doodle{
  float x, y, dx, dy, accY;
  //boolean status; //dead or alive
  ////Step[] steps; //waiting for Step class construction
  int heart; //waiting for stage 4 implementation
  
  
  public Doodle(float x_, float y_){
    x = x_;
    y = y_;
    //dx = 0; necessary?
    dy= 0;
    //status = true; 
    //steps = ?
    heart = 0;
  }
  
  void display(){
    imageMode(CENTER);
    image(doodleAngel, x, y, doodleAngel.width/3, doodleAngel.height/3);
  }
  
  void jump(){
    dy = -15;
  }
  
  void gravity(){
    if(!onStep()){
      dy += gravity;
    }
  }
  
  boolean onStep(){
    if(x<500 && x>200 && y > 800){
       return true;
    }return false;
    
    //for(Step s : steps){
    //  if(x<s.stepLength + s.x && s < x && y == s.y){
    //    return true;
    //  }
    //}return false;
  }
  
  void move(){
   y += dy;
  }
  
  void moveLeft(){
    x = x-5;
  }
  
  void moveRight(){
    x = x+5;
  }
   
   //check if dead or alive
  boolean dies(){
   if(y >= 1000){
     return false;
   }return heart >=0;
  }
  
  //boolean getCandy(){
  //  return false;
  //}
  
  //void victory(){}
  
  //void injure(){}
  
  //void addStep(){}

}
