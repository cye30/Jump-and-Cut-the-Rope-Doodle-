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
PImage monsterIm1;
PImage monsterIm2;
Monsters toothy = new Monsters(464, 190, 0);
Monsters biggy = new Monsters(536, 460, 0);
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
   monsterIm1=loadImage("monster1.png");
   monsterIm2= loadImage("monster2.png");
   candyImg = loadImage("candyIMG.png");
   starImg = loadImage("starImg.png");
   doodle = new Doodle(startX, startY);
   if(monster.size() < 2){
     monster.add(0, toothy);
     monster.add(0, biggy);
   }
   

   restartB = loadImage("restartButton.png");
   mode = 0;

  //background
  size(600,800);
  background(225);

  //candy
  candy = new Candy(300,300,30,points);
  if(points.size() < 2){
    points.add(0, new float[]{200,250});
    points.add(0, new float[]{300,200});
  }
  
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
        for(int i = 0; i<monster.size(); i++){
          monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
        }
      }
    }
  }
}

void draw(){
  background(255);
  text("mode: "+mode, 50, 320);
  
  //buttons
  for(Button m : buttons){
    m.display();
  }
  triangle(105,53,105,72,120,62);
  image(restartB, 60, 60, restartB.width/22, restartB.height/22);

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
      //add sprinkles
    } 
    
  }else if (doodle.dies()||candy.dies()){
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
    doodle.accY = 0;
  }

  //monster stuff
  if(monster.size() >0){
    monster.get(0).monsMove();
    monster.get(0).display(monsterIm1);
    monster.get(0).attack(doodle);
    
    monster.get(1).display(monsterIm2);
    monster.get(1).attack(doodle);
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
    candy.cut();
  }
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
