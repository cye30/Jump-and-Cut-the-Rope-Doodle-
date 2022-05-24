public class Doodle{
  float x, y, dx, dy;
  //boolean status; //dead or alive
  ////Step[] steps; //waiting for Step class construction
  ////int heart; //waiting for stage 4 implementation
  
  
  public Doodle(float x_, float y_){
    x = x_;
    y = y_;
    //dx = 0; necessary?
    dy= 0;
    //status = true; 
    //steps = ?
    //heart = 0;
  }
  
  void display(){
    imageMode(CENTER);
    image(doodleAngel, x, y, doodleAngel.width/2.5, doodleAngel.height/2.5);
  }
  
  void jump(){
    dy = 5;
  }
  
  void gravity(){
    if(!onStep()){
      dy -= gravity;
    }
  }
  
  boolean onStep(){
    if(x<800 && x>100 && y == 1000){
       dy = 0;
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
 
  
  //boolean getCandy(){
  //  return false;
  //}
  
  //void victory(){}
  
  //void injure(){}
  
  //void addStep(){}

}
