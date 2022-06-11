import processing.sound.*;
SoundFile music;
final float gravity = 1;

int menuPg = -1;
int winPg = 0;
int level1 = 1;
int pageMode;

int left = 0;
int right = 1;
int moveMode;

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
PImage monsterIm1;
PImage monsterIm2;
Monsters toothy = new Monsters(464, 190, 0);
Monsters biggy = new Monsters(136, 460, 0);
ArrayList<Monsters> monster = new ArrayList<Monsters>();


//construct candy stuff;
Candy candy;
PImage candyImg;
PImage candyL;
PImage candyR;
PImage starImg;
PImage starUImg;
ArrayList<float[]> points = new ArrayList<float[]>();
boolean candyBroken = false;

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

  pageMode = menuPg;
  //background
  size(600, 800);
  background(225);

  //candy
  candy = new Candy(300, 300, 30, points, arrSpikes);
  if (points.size() < 2) {
    points.add(0, new float[]{200, 250});
    points.add(0, new float[]{300, 200});
  }

  //music
  music = new SoundFile(this, "game_music.wav");
  //music.play();

  won = new Win();
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
            //music.play();
            loop();
          }
        }
        //restarting
        else if (m.equals(buttons[1])) {
          music.pause();
          setup();
          pageMode = level1;
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
        pageMode = 1;
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
        setup();
        pageMode++;
      }
    }
  }
  
  if(play.overSqrt()){
    pageMode = 1;
  }
}

void mouseDragged() {
  //use y = mx+b to find intersection of points
  if (mouseX-pmouseX != 0) {
    float slope = (mouseY-pmouseY)/(mouseX-pmouseX);
    float b = mouseY-(slope*mouseX);
    for (int i = 0; i < candy.fixPoint.size(); i++) {
      /*float first = ((candy.x-candy.fixPoint.get(i)[0])*(pmouseY-candy.fixPoint.get(i)[1]) - (candy.y-candy.fixPoint.get(i)[1])*(pmouseX-candy.fixPoint.get(i)[0])) / ((candy.y-candy.fixPoint.get(i)[1])*(mouseX-pmouseX) - (candy.x-candy.fixPoint.get(i)[0])*(mouseY-pmouseY));
       float sec = ((mouseX-pmouseX)*(pmouseY-candy.fixPoint.get(i)[1]) - (mouseY-pmouseY)*(pmouseX-candy.fixPoint.get(i)[0])) / ((candy.y-candy.fixPoint.get(i)[1])*(mouseX-pmouseX) - (candy.x-candy.fixPoint.get(i)[0])*(mouseY-pmouseY));
       if(first >= 0 && first <= 1 && sec >= 0 && sec <= 1){
       candy.cut(i);
       }*/
      float ropeSlope = (candy.y-candy.fixPoint.get(i)[1])/(candy.x-candy.fixPoint.get(i)[0]);
      float bRope = candy.y-(ropeSlope*candy.x);
      float xCor = (b-bRope)/(ropeSlope-slope);
      if (pmouseX-xCor >= 0 && mouseX-xCor <= 0 || pmouseX-xCor <= 0 && mouseX-xCor >= 0) {
        if (candy.x <= candy.fixPoint.get(i)[0] && xCor >= candy.x && xCor <= candy.fixPoint.get(i)[0]) {
          candy.cut(i);
        } else if (candy.x >= candy.fixPoint.get(i)[0] && xCor <= candy.x && xCor >= candy.fixPoint.get(i)[0]) {
          candy.cut(i);
        }
      }
    }
  }
}

void draw() {
  //cut candy part
  if (mousePressed) {
    cursor(CROSS);
    stroke(150, 150, 150);
    strokeWeight(6);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  if(pageMode == menuPg){
    image(Menu, 0, 0, Menu.width/1.95, Menu.height/1.95);
    play.display();
    textSize(50);
    fill(0,150,0);
    text("PLAY", 90,453);
  }
  
  if(pageMode != menuPg){
    background(255);
    //text("mode: "+mode, 50, 320);
  
    //buttons
    for (Button m : buttons) {
      m.display();
    }
  
    //pause and restart icons
    imageMode(CENTER);
    triangle(105, 53, 105, 72, 120, 62);
    image(restartB, 60, 60, restartB.width/22, restartB.height/22);
  
    //step stuff
    for (Steps s : game1) { //modify this if change game
      s.drawStep();
    }

    //doodle stuff
    if (keyPressed && pageMode != winPg) {
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

    //spikes
    spike.display();

    //doodle stuff
    doodle.gravity();
    doodle.move();
    //text("dy of doodle is " + doodle.dy, 50, 100);
    doodle.display(); //draw out doodle

    if (candyBroken == false) {
      if (doodle.victory(candy) || pageMode == winPg) {
        if (counter < 5) {
          pageMode = winPg;
          monster.clear();
          if (onStep()) {
            counter++;
            doodle.jump();
            doodle.gravity();
            doodle.move();
            //sprinkles!!
            stars.add(new Sprinkle(doodle.x, doodle.y+120, -5));
            stars.add(new Sprinkle(doodle.x, doodle.y+120, 5));
            stars.add(new Sprinkle(doodle.x, doodle.y+70, 8));
            stars.add(new Sprinkle(doodle.x, doodle.y+70, -8));
          }
          for (Sprinkle s : stars) {
            s.gravity();
            s.move();
            s.display();
          }
        } else {
          //draw win tab
          won.display();
          for (Button m : buttonWin) {
            m.display();
            imageMode(CORNER);
            image(restartB, restartWin.sqrtX, restartWin.sqrtY, restartB.width/15, restartB.height/15);
            image(menuButton, menu.sqrtX + 9, menu.sqrtY + 13, menuButton.width/20, menuButton.height/20);
            strokeWeight(8);
            triangle(nextLev.sqrtX + 23, nextLev.sqrtY + 20, nextLev.sqrtX + 23, nextLev.sqrtY + 50, nextLev.sqrtX + 48, nextLev.sqrtY + 35);
          }
        }
      }
    } else if (doodle.dies()||candy.dies()) {
      music.pause();
      setup();
      for (int i = 0; i<monster.size(); i++) {
        monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
      }
      skipStep = false;
    }
    candy.candyAchieved(doodle);
    //text("monsnter arraylist size is: "+ monster.size(), 50, 500);


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

    //text("toothy's width= " + monsterIm1.width/5, 50, 280);
    //text("toothy's height= " + monsterIm1.height/5, 50, 270);
    //text("toothy's x= " + toothy.x, 50, 300);
    //text("toohty's y= " + toothy.y, 50, 290);
    //text("biggy's width= " + monsterIm2.width/5, 50, 240);
    //text("biggy's height= " + monsterIm2.height/5, 50, 230);
    //text("biggy's x= " + biggy.x, 50, 260);
    //text("biggy's y= " + biggy.y, 50, 250);
  
    //candy stuff
    if (mousePressed) {
      cursor(CROSS);
      stroke(150, 150, 150);
      strokeWeight(6);
      line(mouseX, mouseY, pmouseX, pmouseY);
    }
    candy.display(); //test candy!!!
    //text("candy dx: " + candy.dx, 50,200);
    //text("candy dy: " + candy.dy, 50,210);
    //text("starScore: " + candy.getScore(), 50,220); //starScore
    candy.move();
    if (candy.breakCandy) {
      candyBroken = true;
    }
  
  
    //boarders
    stroke(0, 150, 0);
    fill(0, 150, 0);
  
    rect(0, 0, width, 28); // Top
    rect(width-28, 0, 28, height); // Right
    rect(0, height-28, width, 28); // Bottom
    rect(0, 0, 28, height); // Left
  }
}
  

boolean onStep() {
  for (Steps s : game1) { //modify this if change game
    if (doodle.x <s.leng + s.x && s.x < doodle.x && (doodle.y+51<= s.y+16 && doodle.y+51 >= s.y) && !skipStep) {
      doodle.y = s.y-51;
      return true;
    }
  }
  return false;
}
