 import processing.sound.*;
SoundFile music;
final float gravity = 1;

int menuPg = 0;
int winPg = 1;
int levels = 2;
int pageMode = menuPg;
int level1 = 1;
int level2 = 2;
int level;

int left = 0;
int right = 1;
int moveMode;

Levels lev1;

//int score;

PImage Menu;

//construct buttons
PImage restartB;
Button restart = new Button(37, 40);
Button pause = new Button(90, 40);
Button[] buttons = new Button[]{pause, restart};

PImage menuButton;
Button restartWin = new Button(160, 540, 70);
Button menu = new Button(300-(restartWin.sqrtSizeX/2), 540, 70);
Button nextLev = new Button(370, 540, 70);
Button[] buttonWin = new Button[]{restartWin, menu, nextLev};

Button play = new Button(80, 410, 140, 50);

//construct steps for this game

Steps b = new Steps(240, 623);
Steps[] game1 = new Steps[]{b};

Steps a = new Steps(424, 686);
Steps c = new Steps(56, 560);
Steps[] game2 = new Steps[]{a, b, c};

//construct the doodle; sample 1
float startX = 300; //for organizational purposes
float startY = 560; //for organizational purposes
PImage doodleAngelLeft;
PImage doodleAngelRight;
PImage doodleWins;
boolean skipStep;
Doodle doodle;

//construct monster; sample 1
PImage monsterIm1;
PImage monsterIm2;
Monsters toothy = new Monsters(464, 190, 0);
Monsters biggy = new Monsters(136, 460, 0);
ArrayList<Monsters> monster = new ArrayList<Monsters>();


//construct candy stuff;
Candy candy;
boolean created;
PImage candyImg;
PImage candyL;
PImage candyR;
PImage starImg;
PImage starUImg;
ArrayList<float[]> points = new ArrayList<float[]>();
boolean candyBroken;

//construct spikes
Spikes spike = new Spikes(100, 400, 5);
Spikes[] arrSpikes = new Spikes[]{spike};
Win won;

//special effect at the end
ArrayList<Sprinkle> stars = new ArrayList<Sprinkle>();

int counter;


void setup() {
  //import doodle image
  Menu = loadImage("MenuPage.png");
  menuButton = loadImage("menuB.png");
  doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
  doodleAngelRight = loadImage("doodleTheAngelRight.png");
  doodleWins = loadImage("success.png");
  monsterIm1=loadImage("monster1.png");
  monsterIm2= loadImage("monster2.png");
  candyImg = loadImage("candyIMG.png");
  candyL = loadImage("candyL.png");
  candyR = loadImage("candyR.png");
  starImg = loadImage("starImg.png");
  starUImg = loadImage("starUIMG.png");
  doodle = new Doodle(startX, startY);
  if (monster.size() < 2) {
    monster.add(0, toothy);
    monster.add(0, biggy);
  }

  counter = 0;

  //restart button image
  restartB = loadImage("restartButton.png");

  lev1 = new Levels();

  //background
  size(600, 800);
  background(225);

  //candy
  points.clear();
  if(level == 1){
    points.add(0, new float[]{300,100});
  }
  if(level == 2 && points.size() < 2){
    points.add(0, new float[]{200,250});
    points.add(0, new float[]{400,200});
  }
  
  candy = new Candy(300,250,30,points,5, arrSpikes);
  created = false;
  
  candy.addStar(300,340);
  candy.addStar(300,400);
  candy.addStar(300,460);

  //music
  music = new SoundFile(this, "game_music.wav");
  //music.play();

  won = new Win();
  candyBroken = false;
}

//for the buttons!
void mousePressed() {
  if(pageMode != winPg){
    for (Button m : buttons) {
      if (m.overSqrt()) {
        //pausing
        if (m.equals(buttons[0])) {
          if (looping) {
            music.pause();
            noLoop();
          } else {
            music.play();
            loop();
          }
        }
        //restarting
        else if (m.equals(buttons[1])) {
          music.pause();
          setup();
          pageMode = levels;
          for (int i = 0; i<monster.size(); i++) {
            monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
          }
        }
      }
    }
  }

  for (Button m : buttonWin) {
    if (m.overSqrt()) {
      //restart
      if (m.equals(buttonWin[0])) {
        music.pause();
        setup();
        pageMode = levels;
        for (int i = 0; i<monster.size(); i++) {
          monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
        }
      }
      //menu
      else if (m.equals(buttonWin[1])) {
        music.pause();
        setup();
        pageMode = menuPg;
      }
      //next level
      else if (m.equals(buttonWin[2])) {
        music.pause();
        if(level+1 == 3){
          pageMode = menuPg;
        } else {
          pageMode = levels;
          level++;
        } 
        setup();
      }
    }
  }

  if(play.overSqrt()){
    music.pause();
    level = level1;
    setup();
    pageMode = levels;
  }
}

void mouseDragged() {
    for(int i = 0; i < candy.list.size(); i++){

      Node current = candy.list.get(i).first;
      while(current.next != null){
        float first = ((current.next.x-current.x)*(pmouseY-current.next.y) - (current.y-current.next.y)*(pmouseX-current.x)) / ((current.y-current.next.y)*(mouseX-pmouseX) - (current.next.x-current.x)*(mouseY-pmouseY));
        float sec = ((mouseX-pmouseX)*(pmouseY-current.next.y) - (mouseY-pmouseY)*(pmouseX-current.x)) / ((current.y-current.next.y)*(mouseX-pmouseX) - (current.next.x-current.x)*(mouseY-pmouseY));
         if(first >= 0 && first <= 1 && sec >= 0 && sec <= 1){
         candy.cut(i);
        }
        current = current.next;
      }


      //Node current = candy.list[i].first;
      //while(current.next != null){
      //  float ropeSlope = (current.y-current.next.y)/(current.x-current.next.x);
      //  float bRope = candy.candy.y-(ropeSlope*candy.candy.x);
      //  float xCor = (b-bRope)/(ropeSlope-slope);
      //  if(pmouseX-xCor >= 0 && mouseX-xCor <= 0 || pmouseX-xCor <= 0 && mouseX-xCor >= 0){
      //    if(current.x <= current.next.x && xCor >= current.x && xCor <= current.next.x){
      //      candy.cut(i);
      //    } else if(current.x >= current.next.x && xCor <= current.x && xCor >= current.next.x){
      //      candy.cut(i);
      //    }
      //  }
      //  current = current.next;
      //}
    //}
  }
}

void draw(){
  if(pageMode != menuPg){
    background(255);

    //boarders
    stroke(0, 150, 0);
    fill(0, 150, 0);

    rect(0, 0, width, 28); // Top
    rect(width-28, 0, 28, height); // Right
    rect(0, height-28, width, 28); // Bottom
    rect(0, 0, 28, height); // Left

    //buttons
    for (Button m : buttons) {
      m.display();
    }

    //pause and restart icons
    imageMode(CENTER);
    triangle(105, 53, 105, 72, 120, 62);
    image(restartB, 60, 60, restartB.width/22, restartB.height/22);

    //doodle stuff
    if (keyPressed) {
      if (key == 'e') {
        if (onStep()) {
          doodle.jump();
        }
      }
      if (key == 's') {
        moveMode = left;
        doodle.moveLeft();
      }
      if (key == 'f') {
        moveMode = right;
        doodle.moveRight();
      }
    }
  }

  //level 1
  if(level == level1){
    for (Steps s : game1) {
      s.drawStep();
    }

    doodle.gravity();
    doodle.move();
    doodle.display();

    candy.display();
    candy.move();
    if (candy.breakCandy) {
      candyBroken = true;
    }
    lev1.celebrate();

    candy.candyAchieved(doodle);

    if (onStep() && !skipStep) {
      doodle.dy = 0;
    }
  }

  //level 2
  if(level == level2){
    //step stuff
    for (Steps s : game2) {
      s.drawStep();
    }

    //spikes
    for(Spikes s : arrSpikes) {
      s.display();
    }

    //doodle stuff
    doodle.gravity();
    doodle.move();
    doodle.display(); //draw out doodle

    candy.display();
    candy.move();
    if (candy.breakCandy) {
      candyBroken = true;
    }

    lev1.celebrate();

    candy.candyAchieved(doodle);

    if (onStep() && !skipStep) { //doodle stops once it lands on the step
      doodle.dy = 0;
    }

    //monster stuff
    if (monster.size() >0) { //prevent out of bound error
      monster.get(0).monsHorMove();
      monster.get(0).monsMove();
      monster.get(0).display(monsterIm1);
      monster.get(0).attack(doodle);

      monster.get(1).display(monsterIm2);
      monster.get(1).attack(doodle);
      stroke(225, 0, 0);
      monster.get(1).shoot(monster.get(1).x, monster.get(1).y+33, 4);
      monster.get(1).monsAttract(doodle);
      monster.get(1).monsMove();
    }

  }

  if(pageMode == menuPg){
    imageMode(CORNER);
    image(Menu, 0, 0, Menu.width/1.95, Menu.height/1.95);
    play.display();
    textSize(50);
    fill(0,150,0);
    text("PLAY", 90,453);

    if(level >= 2){
      textSize(20);
      text("More Levels to Come!", 350,700);
    }
  }

  //cut candy part
  if (mousePressed){
    cursor(CROSS);
    stroke(150, 150, 150);
    strokeWeight(6);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
}




boolean onStep() {
  Steps[] gam = new Steps[]{};
  if(level == 1){
    gam = game1;
  }
  else if(level == 2){
    gam = game2;
  }
  for (Steps s : gam) { //modify this if change game
    if (doodle.x-doodleAngelLeft.width/30 <s.leng + s.x && s.x < doodle.x+doodleAngelLeft.width/30 && (doodle.y+51<= s.y+16 && doodle.y+51 >= s.y) && !skipStep) {
      doodle.y = s.y-51;
      return true;
    }
  }
  return false;
}
