int gravity, score;
Doodle doodle;
//Candy candy;
//Monster[] monster;
//Soundfile music;

doodle = new Doodle(450, 1000); //construct the doodle for this game

void setup(){
  //background
  size(900,1300);
  background(225);
  
  //boarders
  stroke(0, 150, 0);
  fill(0, 150, 0);
  
  rect(0, 0, width, 35); // Top
  rect(width-35, 0, 35, height); // Right
  rect(0, height-35, width, 35); // Bottom
  rect(0, 0, 35, height); // Left

}

void draw(){
  
  //doodle stuff
  if(keyPressed){
    if(key == 'e'){
      doodle.jump();
    }else if(key == 's'){
      doodle.moveLeft();
    }else if(key == 'f'){
       doodle.moveRight();
    }
  }
  doodle.display(); //draw out doodle

}