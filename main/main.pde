final float gravity = 1;
//int score;
PImage doodleAngelLeft;
PImage doodleAngelRight;
PImage monsterIm;
float startX = 300; //for organizational purposes
float startY = 560; //for organizational purposes
boolean skipStep;
int mode;

//construct buttons
Button restart = new Button(37, 40);
Button pause = new Button(90, 40);
Button[] buttons = new Button[]{pause, restart};

//construct steps for this game; sample 1
Steps a = new Steps(424, 686);
Steps b = new Steps(240, 623);
Steps c = new Steps(56, 560);
Steps[] game1 = new Steps[]{a, b, c};

//construct the doodle; sample 1
Doodle doodle = new Doodle(startX, startY); 

//construct monster; sample 1
Monsters toothy = new Monsters(464, 440, 0);
Monsters biggy = new Monsters(136, 360, 0);
Monsters[] monster = new Monsters[]{toothy, biggy};

//Candy candy;
//Soundfile music;

 
void setup(){
  //import doodle image
   doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
   doodleAngelRight = loadImage("doodleTheAngelRight.png");
   monsterIm = loadImage("monster1.png");
   
  //background
  size(600,800);
  background(225);
}

//for the buttons!
void mousePressed(){
  for(Button m : buttons){
    if(m.overSqrt()){
      //pausing
        if(looping){
      if(m.equals(buttons[0])){ 
          noLoop();
        }else{
          loop();
        }
      }
      //restarting
      else if(m.equals(buttons[1])){
        setup();
        doodle = new Doodle(startX, startY);
        toothy.display(); //draw out monster
      }
    }
  }
}

void draw(){
  background(255);
  
  //buttons
  for(Button m : buttons){
    m.display();
  }
  
  //boarders
  stroke(0, 150, 0);
  fill(0, 150, 0);
  
  rect(0, 0, width, 28); // Top
  rect(width-28, 0, 28, height); // Right
  rect(0, height-28, width, 28); // Bottom
  rect(0, 0, 28, height); // Left
  
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
  text("dy of doodle is " + doodle.dy, 50, 100);
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
  //toothy.attack(doodle); //attacking, set skipStep to false
  noFill(); //for testing purposes
  circle(464, 440, 100);
}

boolean onStep(){
    //if(x<500 && x>200 && y > 800){ //for testing jump methods solely
    //   return true;
    //}return false;
    
    for(Steps s : game1){ //modify this if change game
      if(doodle.x <s.leng + s.x && s.x < doodle.x && (doodle.y+51<= s.y+16 && doodle.y+51 >= s.y )){
        return true;
      }
    }return false;
  }
  

//void endGame(){
//  clear();
//}
