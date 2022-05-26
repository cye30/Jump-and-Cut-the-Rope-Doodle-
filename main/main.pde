int score;
PImage doodleAngelLeft;
PImage doodleAngelRight;
final float gravity = 1;
int mode;

//construct the doodle and steps for this game; sample 1
Steps a = new Steps(530, 858);
Steps b = new Steps(300, 779);
Steps c = new Steps(70, 700);
Steps[] game1 = new Steps[]{a, b, c};
Doodle doodle = new Doodle(375, 700); 


//Candy candy;
//Monster[] monster;
//Soundfile music;

 
void setup(){
  //import doodle image
   doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
   doodleAngelRight = loadImage("doodleTheAngelRight.png");
  
  //background
  size(750,1000);
  background(225);
}

void draw(){
  background(255);
  
  //boarders
  stroke(0, 150, 0);
  fill(0, 150, 0);
  
  rect(0, 0, width, 35); // Top
  rect(width-35, 0, 35, height); // Right
  rect(0, height-35, width, 35); // Bottom
  rect(0, 0, 35, height); // Left
  
  
  for(Steps s : game1){ //modify this if change game
      s.drawStep();
    }
  
  //doodle stuff
  if(keyPressed){
    if(key == 'e'){ //if statements such that more than 1 direction can be called at the same time
      if(onStep()){
        doodle.jump();
      }
    }if(key == 's'){
      mode = 0;
      doodle.moveLeft();
    }if(key == 'f'){
      mode = 1;
      doodle.moveRight();
    }
  }
  
  doodle.move();
  doodle.gravity();
  text("dy is " + doodle.dy, 100, 100);
  doodle.display(); //draw out doodle
  
  if(onStep()){
    
    doodle.dy = 0;
    doodle.accY = 0;
  }
  
  if(doodle.dies()){
    doodle = new Doodle(375, 700);
  }

}

boolean onStep(){
    //if(x<500 && x>200 && y > 800){ //for testing jump methods solely
    //   return true;
    //}return false;
    
    for(Steps s : game1){ //modify this if change game
      if(doodle.x <s.leng + s.x && s.x < doodle.x && (doodle.y+64 <= s.y+20 && doodle.y+64 >= s.y )){
        
        return true;
      }
    }return false;
  }
  

//void endGame(){
//  clear();
//}
