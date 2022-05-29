public class Doodle{
  float x, y, dx, dy, accY;
  //boolean status; //dead or alive
  //ArrayList<Steps> steps;//waiting for Step class construction
  int heart; //waiting for stage 4 implementation
  
  
  public Doodle(float x_, float y_){
    x = x_;
    y = y_;
    //dx = 0; necessary?
    dy= 0;
    //status = true; 
    heart = 5;
    
    ////store the steps into arraylist
    //for(int i = 0; i < input.length; i++){
    //  steps.add(input[i]);
    //}
  }
  
  void display(){
    //drawing doodle
    imageMode(CENTER);
    if(mode == 0){
      image(doodleAngelLeft, x, y, 4 * doodleAngelLeft.width/15, 4 * doodleAngelLeft.height/15);
    }if(mode == 1){
      image(doodleAngelRight, x, y, 4 * doodleAngelRight.width/15, 4 * doodleAngelRight.height/15);
    }
    noFill();
    circle(x, y, 125);
    
    text("doodle's width= " + 4*doodleAngelLeft.width/15, 80, 90);
    text("doodle's height= " + 4*doodleAngelLeft.height/15, 80, 100);
    text("doodle's heart= " + heart, 80, 110);
    
    //drawing steps
    //for(Steps s : steps){
    //  s.drawStep();
    //}
  }
  
  void jump(){
    dy = -14.5;
  }
  
  void gravity(){
    if(!onStep()){
      dy += gravity;
    }
  }
  
  //boolean onStep(){
  //  if(x<500 && x>200 && y > 800){ //for testing jump methods solely
  //     return true;
  //  }return false;
    
  //  //for(Steps s : steps){ 
  //  //  if(x<s.leng + s.x && s.x < x && y > s.y){
  //  //    return true;
  //  //  }
  //  //}return false;
  //}
  
  void move(){
   y += dy;
  }
  
  void moveLeft(){
    x = x-6;
  }
  
  void moveRight(){
    x = x+6;
  }
   
   //check if dead or alive
  boolean dies(){
   if(y >= 800){
     heart --;
   }
   return heart < 0;
  }
  
  //boolean getCandy(){
  //  return false;
  //}
  
  //void victory(){}
  
  void injure(){
    skipStep = true;
    dy = 6;
  }
  
  //void addStep(){}

}
