public class Doodle{
  float x, y, dx, dy;
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
    if(moveMode == left){
      image(doodleAngelLeft, x, y, 4 * doodleAngelLeft.width/15, 4 * doodleAngelLeft.height/15);
    }if(moveMode == right){
      image(doodleAngelRight, x, y, 4 * doodleAngelRight.width/15, 4 * doodleAngelRight.height/15);
    }if(pageMode == winPg){
      
      image(doodleWins, x, y, 4 * doodleWins.width/15, 4 * doodleWins.height/15);
    }
    //noFill();
    //circle(x, y, 125);
    
    //text("doodle's width= " + 4*doodleAngelLeft.width/15, 50, 110);
    //text("doodle's height= " + 4*doodleAngelLeft.height/15, 50, 120);
    //text("doodle's heart= " + heart, 50, 170);
    
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
    return (dist(x, y, c.x, c.y)<=75);
  }
  
  void injure(){
    skipStep = true;
    dy = 6;
  }
  
  //void addStep(){}

}
