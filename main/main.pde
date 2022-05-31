<<<<<<< HEAD
final float gravity = 1;
//int score;
//Soundfile music;
PImage doodleAngelLeft;
PImage doodleAngelRight;
PImage monsterIm;
float startX = 300; //for organizational purposes
float startY = 560; //for organizational purposes
boolean skipStep;
int mode;

Candy candy;
PImage candyImg;
PImage starImg;

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
   candyImg = loadImage("candyIMG.png");
   starImg = loadImage("starImg.png");

  //background
  size(600,800);
  background(225);

  //candy
  float[][] points = {{400,300},{300,350}};
  candy = new Candy(400,400,30,points);
}

//for the buttons!
void mousePressed(){
  for(Button m : buttons){
    if(m.overSqrt()){
      //pausing
      if(m.equals(buttons[0])){
        if(looping){
          noLoop();
        }else{
          loop();
        }
      }
      //restarting
      else if(m.equals(buttons[1])){
        setup();
        doodle = new Doodle(startX, startY);
        toothy = new Monsters(464, 440, 0); //draw out monster
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

  if(mousePressed == true){
    cursor(CROSS);
    stroke(150,150,150);
    strokeWeight(6);
    line(mouseX, mouseY, pmouseX, pmouseY);
    candy.cut();
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
<<<<<<< HEAD
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

<<<<<<< HEAD
  if(doodle.dies()){
    doodle = new Doodle(startX, startY);
    skipStep = false;
  }

  //monster stuff
  toothy.monsMove();
  toothy.display(); //draw out monster
  toothy.attack(doodle); //attacking, set skipStep to false

  candy.display(); //test candy!!!
  text("candy dx: " + candy.dx, 50,200);
  text("candy dy: " + candy.dy, 50,210);
  text("starScore: " + candy.getScore(), 50,220); //starScore
  //candy.move();
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
