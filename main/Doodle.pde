public class Doodle{
  float x, y, dx, dy;
  boolean status; //dead or alive
  //Step[] steps; //waiting for Step class construction
  
  //int heart; //waiting for stage 4 implementation
  
  
  public Doodle(float x_, float y_){
    x = x_;
    y = y_;
    //dx = 0; necessary?
    dy= 0;
    status = true; 
    //steps = ?
    //heart = 0;
  }
  
  void display(){}
  
  void jump(){}
  
  void gravity(){
    dy += gravity;
  }
  
  void moveLeft(){
    x--;
  }
  
  void moveRight(){
    x++;
  }
  
  boolean getCandy(){}
  
  void victory(){}
  
  void injure(){}
  
  void addStep(){}

}
