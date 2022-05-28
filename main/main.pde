int score;
PImage doodleAngelLeft;
PImage doodleAngelRight;
PImage monsterIm;
final float gravity = 1;
int mode;
float startX = 375;
float startY = 700;
boolean skipStep;

//construct the doodle and steps for this game; sample 1
Steps a = new Steps(530, 858);
Steps b = new Steps(300, 779);
Steps c = new Steps(70, 700);
Steps[] game1 = new Steps[]{a, b, c};
Doodle doodle = new Doodle(startX, startY); 

//construct monster; sample 1
Monsters toothy = new Monsters(580, 550, 0);


//Candy candy;
//Monster[] monster;
//Soundfile music;

 
void setup(){
  //import doodle image
   doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
   doodleAngelRight = loadImage("doodleTheAngelRight.png");
   monsterIm = loadImage("monster1.png");
  
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
  
  //step stuff
  for(Steps s : game1){ //modify this if change game
    s.drawStep();
  }
  
  //doodle stuff
  if(keyPressed){
    if(key == 'e'){
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
  
  doodle.gravity();
  doodle.move();
  text("dy of doodle is " + doodle.dy, 100, 100);
  doodle.display(); //draw out doodle
  
  
  if(onStep() && !skipStep){
    doodle.dy = 0;
    doodle.accY = 0;
  }
  
  if(doodle.dies()){
    doodle = new Doodle(startX, startY);
    skipStep = false;
  }
      
  //monster stuff
  toothy.display(); //draw out monster
  toothy.attack(doodle); //attacking, set skipStep to false
  noFill(); //for testing purposes
  circle(580, 550, 125);
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
