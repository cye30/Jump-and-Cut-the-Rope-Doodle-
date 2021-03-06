public class Doodle{
  float x, y, dx, dy;
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
    if(pageMode == winPg){
      image(doodleWins, x, y, 4 * doodleWins.width/15, 4 * doodleWins.height/15);
    }else if(moveMode == left){
      image(doodleAngelLeft, x, y, 4 * doodleAngelLeft.width/15, 4 * doodleAngelLeft.height/15);
    }else if(moveMode == right){
      image(doodleAngelRight, x, y, 4 * doodleAngelRight.width/15, 4 * doodleAngelRight.height/15);
    }
  }
  
  void jump(){
    dy = -14.5;
  }
  
  void gravity(){
    if(!onStep()){
      dy += gravity;
    }
  }
  
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
    for(Monsters mon : monster){
     if(y >= 800 || bulletHit(mon)){
       heart --;
     }
   }
   return heart < 0;
  }
  
  boolean bulletHit(Monsters m){
    for(float[] b : m.bullet){
      if(b[0]>x-35 && b[0]<x+35 && b[1]>y-51 && b[1]<y+51){
        return true;
      }
    }return false;
  }
  
  boolean victory(Candy c){
    return (dist(x, y, c.candy.x, c.candy.y)<=75);
  }
  
  void injure(){
    skipStep = true;
    dy = 6;
  }
  
  //void addStep(){}

}
