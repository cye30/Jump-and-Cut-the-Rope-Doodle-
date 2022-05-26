int score;
PImage doodleAngel;
Doodle doodle = new Doodle(375, 800); //construct the doodle for this game;
Candy candy;
//Monster[] monster;
//Soundfile music;
final float gravity = 1;
 
void setup(){
  //import doodle image
  doodleAngel = loadImage("doodleTheAngel.png");
  
  //background
  size(750,1000);
  background(225);
  
  //candy
  float[][] points = {{400,300},{300,400}};
  candy = new Candy(400,400,30,points);
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
  
  //doodle stuff
  if(keyPressed){
    if(key == 'e'){ //if statements such that more than 1 direction can be called at the same time
      if(doodle.onStep()){
        doodle.jump();
      }
    }if(key == 's'){
      doodle.moveLeft();
    }if(key == 'f'){
       doodle.moveRight();
    }
  }
  
  doodle.move();
  doodle.gravity();
  text("dy is " + doodle.dy, 100, 100);
  doodle.display(); //draw out doodle
  
  if(doodle.onStep()){
    doodle.dy = 0;
    doodle.accY = 0;
  }
  
  candy.display(); //test candy!!!
  
//  if(doodle.dies()){
//    endGame();
//  }

}

//void endGame(){
//  clear();
//}
