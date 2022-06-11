 import processing.sound.*;
SoundFile music;
final float gravity = 1;
int mode;
//int score;

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
PImage monsterIm1;
PImage monsterIm2;
Monsters toothy = new Monsters(464, 190, 0);
Monsters biggy = new Monsters(136, 460, 0);
ArrayList<Monsters> monster = new ArrayList<Monsters>();


//construct candy stuff;
Candy candy;
boolean created;
PImage candyImg;
PImage starImg;
ArrayList<float[]> points = new ArrayList<float[]>();

//construct spikes
Spikes spike = new Spikes(400,500,5);
Win won;

//special effect at the end
ArrayList<Sprinkle> stars = new ArrayList<Sprinkle>();


void setup(){
  //import doodle image
   doodleAngelLeft = loadImage("doodleTheAngelLeft.png");
   doodleAngelRight = loadImage("doodleTheAngelRight.png");
   doodleWins = loadImage("success.png");
   monsterIm1=loadImage("monster1.png");
   monsterIm2= loadImage("monster2.png");
   candyImg = loadImage("candyIMG.png");
   starImg = loadImage("starImg.png");
   doodle = new Doodle(startX, startY);
   if(monster.size() < 2){
     monster.add(0, toothy);
     monster.add(0, biggy);
   }

   //restart button image
   restartB = loadImage("restartButton.png");

   mode = 0;
  //background
  size(600,800);
  background(225);

  //candy
  if(points.size() < 2){
    points.add(0, new float[]{200,250});
    points.add(0, new float[]{400,200});
  }
  candy = new Candy(300,300,30,points);
  created = false;

  //music
  music = new SoundFile(this, "game_music.wav");
  //music.play();         

  won = new Win();
}

//for the buttons!
void mousePressed(){
  for(Button m : buttons){
  if(m.overSqrt()){
    //pausing
    if(m.equals(buttons[0])){
      if(looping){
        music.pause();
        noLoop();
      }else{
        music.play();
        loop();
      }
    }
    //restarting
    else if(m.equals(buttons[1])){
      music.pause();
      setup();
      for(int i = 0; i<monster.size(); i++){
        monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
      }
     }
   }
  }
}

void mouseDragged(){
  //use y = mx+b to find intersection of points
  if(mouseX-pmouseX != 0){
    float slope = (mouseY-pmouseY)/(mouseX-pmouseX);
    float b = mouseY-(slope*mouseX);
    for(int i = 0; i < candy.fixPoint.size(); i++){
      /*float first = ((candy.x-candy.fixPoint.get(i)[0])*(pmouseY-candy.fixPoint.get(i)[1]) - (candy.y-candy.fixPoint.get(i)[1])*(pmouseX-candy.fixPoint.get(i)[0])) / ((candy.y-candy.fixPoint.get(i)[1])*(mouseX-pmouseX) - (candy.x-candy.fixPoint.get(i)[0])*(mouseY-pmouseY));
      float sec = ((mouseX-pmouseX)*(pmouseY-candy.fixPoint.get(i)[1]) - (mouseY-pmouseY)*(pmouseX-candy.fixPoint.get(i)[0])) / ((candy.y-candy.fixPoint.get(i)[1])*(mouseX-pmouseX) - (candy.x-candy.fixPoint.get(i)[0])*(mouseY-pmouseY));
      if(first >= 0 && first <= 1 && sec >= 0 && sec <= 1){
        candy.cut(i);
      }*/
      float ropeSlope = (candy.y-candy.fixPoint.get(i)[1])/(candy.x-candy.fixPoint.get(i)[0]);
      float bRope = candy.y-(ropeSlope*candy.x);
      float xCor = (b-bRope)/(ropeSlope-slope);
      if(pmouseX-xCor >= 0 && mouseX-xCor <= 0 || pmouseX-xCor <= 0 && mouseX-xCor >= 0){
        if(candy.x <= candy.fixPoint.get(i)[0] && xCor >= candy.x && xCor <= candy.fixPoint.get(i)[0]){
          candy.cut(i);
        } else if(candy.x >= candy.fixPoint.get(i)[0] && xCor <= candy.x && xCor >= candy.fixPoint.get(i)[0]){
          candy.cut(i);
        }
      }
    }
  }
}

void draw(){
  clear();
  background(255);
  text("mode: "+mode, 50, 320);
  candy.display(3); //test candy!!!

  //draw win tab
  //won.display();

  //buttons
  for(Button m : buttons){
    m.display();
  }

  //pause and restart icons
  triangle(105,53,105,72,120,62);
  image(restartB, 60, 60, restartB.width/22, restartB.height/22);

  //step stuff
  for(Steps s : game1){ //modify this if change game
    s.drawStep();
  }

  //cut candy part
  if(mousePressed){
    cursor(CROSS);
    stroke(150,150,150);
    strokeWeight(6);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }

  //doodle stuff
  if(keyPressed && mode != 3){
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

  //doodle stuff
  doodle.gravity();
  doodle.move();
  text("dy of doodle is " + doodle.dy, 50, 100);
  doodle.display(); //draw out doodle

  if(doodle.victory(candy) || mode ==3){
    mode = 3;
    monster.clear();
    if(onStep()){
      doodle.jump();
      doodle.gravity();
      doodle.move();
      //sprinkles!!
      stars.add(new Sprinkle(doodle.x, doodle.y+120, -5));
      stars.add(new Sprinkle(doodle.x, doodle.y+120, 5));
      stars.add(new Sprinkle(doodle.x, doodle.y+70, 8));
      stars.add(new Sprinkle(doodle.x, doodle.y+70, -8));
    }
    for(Sprinkle s : stars){
      s.gravity();
      s.move();
      s.display();
    }


  }else if (doodle.dies()||candy.dies()){
    music.pause();
    setup();
    for(int i = 0; i<monster.size(); i++){
      monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
    }
    skipStep = false;
  }
  candy.candyAchieved(doodle);
  text("monsnter arraylist size is: "+ monster.size(), 50, 500);


  if(onStep() && !skipStep){ //doodle stops once it lands on the step
    doodle.dy = 0;
  }


  //monster stuff
  if(monster.size() >0){ //prevent out of bound error
    monster.get(0).monsHorMove();
    monster.get(0).monsMove();
    monster.get(0).display(monsterIm1);
    monster.get(0).attack(doodle);

    monster.get(1).display(monsterIm2);
    monster.get(1).attack(doodle);
    stroke(225,0,0);
    monster.get(1).shoot(monster.get(1).x, monster.get(1).y+33, 4);
    monster.get(1).monsAttract(doodle);
    monster.get(1).monsMove();
  }

  text("toothy's width= " + monsterIm1.width/5, 50, 280);
  text("toothy's height= " + monsterIm1.height/5, 50, 270);
  text("toothy's x= " + toothy.x, 50, 300);
  text("toohty's y= " + toothy.y, 50, 290);
  text("biggy's width= " + monsterIm2.width/5, 50, 240);
  text("biggy's height= " + monsterIm2.height/5, 50, 230);
  text("biggy's x= " + biggy.x, 50, 260);
  text("biggy's y= " + biggy.y, 50, 250);

  //candy stuff
  if(mousePressed){
    cursor(CROSS);
    stroke(150,150,150);
    strokeWeight(6);
    line(mouseX, mouseY, pmouseX, pmouseY);
  }
  //for(int v = 0; v < points.size(); v++){
  //  candy.createArr(points.get(v)[0], points.get(v)[1], candy.x, candy.y);
  //}
  
  text("candy dx: " + candy.dx, 50,200);
  text("candy dy: " + candy.dy, 50,210);
  text("starScore: " + candy.getScore(), 50,220); //starScore
  //candy.move();


  //boarders
  stroke(0, 150, 0);
  fill(0, 150, 0);

  rect(0, 0, width, 28); // Top
  rect(width-28, 0, 28, height); // Right
  rect(0, height-28, width, 28); // Bottom
  rect(0, 0, 28, height); // Left
  spike.display();}

boolean onStep(){
  for(Steps s : game1){ //modify this if change game
    if(doodle.x <s.leng + s.x && s.x < doodle.x && (doodle.y+51<= s.y+16 && doodle.y+51 >= s.y) && !skipStep){
      doodle.y = s.y-51;
      return true;
    }
  }return false;
}
