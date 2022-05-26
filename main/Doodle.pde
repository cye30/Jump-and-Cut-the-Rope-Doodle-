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
    heart = 0;
    
    ////store the steps into arraylist
    //for(int i = 0; i < input.length; i++){
    //  steps.add(input[i]);
    //}
  }
  
  void display(){
    //drawing doodle
    imageMode(CENTER);
    if(mode == 0){
      image(doodleAngelLeft, x, y, doodleAngelLeft.width/3, doodleAngelLeft.height/3);
    }if(mode == 1){
      image(doodleAngelRight, x, y, doodleAngelRight.width/3, doodleAngelRight.height/3);
    }
    
    text("doodle's width= " + doodleAngelLeft.width/3, 100, 200);
    text("doodle's height= " + doodleAngelLeft.height/3, 100, 300);
    
    //drawing steps
    //for(Steps s : steps){
    //  s.drawStep();
    //}
  }
  
  void jump(){
    dy = -20;
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
    x = x-7;
  }
  
  void moveRight(){
    x = x+7;
  }
   
   //check if dead or alive
  boolean dies(){
   if(y >= 1000){
     return true;
   }return heart < 0;
  }
  
  //boolean getCandy(){
  //  return false;
  //}
  
  //void victory(){}
  
  //void injure(){}
  
  //void addStep(){}

}
