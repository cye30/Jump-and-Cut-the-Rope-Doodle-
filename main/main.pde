final float gravity = 1;
int mode;
//int score;
//Soundfile music;

//construct buttons
PImage restartB;
Button restart = new Button(37, 40);
Button pause = new Button(90, 40);
Button[] buttons = new Button[]{pause, restart};

//construct steps for this game; sample 1
Steps a = new Steps(424, 686);
Steps b = new Steps(240, 623);
Steps c = new Steps(56, 560);
Steps[] game1 = new Steps[]{a, b, c};

//construct the doodle; sample 1
float startX = 300; //for organizational purposes
float startY = 560; //for organizational purposes
PImage doodleAngelLeft;
PImage doodleAngelRight;
PImage doodleWins;
boolean skipStep;
Doodle doodle;

//construct monster; sample 1
PImage monsterIm;
Monsters toothy = new Monsters(464, 440, 0);
Monsters biggy = new Monsters(136, 360, 0);
ArrayList<Monsters> monster = new ArrayList<Monsters>();

//construct candy stuff;
Candy candy;
PImage candyImg;
PImage starImg;
ArrayList<float[]> points = new ArrayList<float[]>();
  
//Soundfile music;


void setup(){
  //import doodle image
   doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
   doodleAngelRight = loadImage("doodleTheAngelRight.png");
   doodleWins = loadImage("success.png");
   monsterIm = loadImage("monster1.png");
   candyImg = loadImage("candyIMG.png");
   starImg = loadImage("starImg.png");
   doodle = new Doodle(startX, startY);
   monster.add(0, toothy);
   monster.add(0, biggy);

   restartB = loadImage("restartButton.png");
   mode = 0;

  //background
  size(600,800);
  background(225);

  //candy
  candy = new Candy(300,300,30,points);
  points.add(0, new float[]{200,250});
  points.add(0, new float[]{300,200});
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

  triangle(105,53,105,72,120,62);
  image(restartB, 60, 60, restartB.width/22, restartB.height/22);

  //step stuff
  for(Steps s : game1){ //modify this if change game
    s.drawStep();
  }

  if(mousePressed){
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
      mode = 1;
      doodle.moveRight();
    }
  }

  doodle.gravity();
  doodle.move();
  text("dy of doodle is " + doodle.dy, 50, 100);
  doodle.display(); //draw out doodle
  
  if(doodle.victory(candy)){
    mode = 3;
    for(int i=0; i<monster.size(); i++){ //remove allmosnters
      monster.remove(0);
    }
    //make monster disappear
    //add sprinkles
  }else if (doodle.dies()||candy.dies()){
    setup();
    skipStep = false;
  }
  candy.candyAchieved(doodle);


  if(onStep() && !skipStep){
    doodle.dy = 0;
    doodle.accY = 0;
  }

  //monster stuff
  toothy.monsMove();
  toothy.display(); //draw out monster
  toothy.attack(doodle); //attacking, set skipStep to false

  candy.display(); //test candy!!!
  text("candy dx: " + candy.dx, 50,200);
  text("candy dy: " + candy.dy, 50,210);
  text("starScore: " + candy.getScore(), 50,220); //starScore
  candy.move();
}

boolean onStep(){
    //if(x<500 && x>200 && y > 800){ //for testing jump methods solely
    //   return true;
    //}return false;

    for(Steps s : game1){ //modify this if change game
      if(doodle.x <s.leng + s.x && s.x < doodle.x && (doodle.y+51<= s.y+16 && doodle.y+51 >= s.y) && !skipStep){
        doodle.y = s.y-51;
        return true;
      }
    }return false;
  }


//void endGame(){
//  clear();
//}
