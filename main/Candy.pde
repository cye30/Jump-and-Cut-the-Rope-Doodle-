public class Candy{
  Node candy;
  float radius;
  float[][] star;

  int starScore;
  color c;
  boolean status;
  boolean drawStar=true;
  float starx;
  float stary;
  Spikes[] spike;
  boolean drawCandy = true;
  boolean breakCandy = false;
  float grav;

  ArrayList<float[]> fixPoint;
  ArrayList<NodeList> list;
  int increment;


  //create candy
  public Candy(float xx, float yy, float rad, ArrayList<float[]> fixP, int inc){
    candy = new Node(xx, yy);
    radius = rad;
    fixPoint = fixP;
    starScore = 0;
    list = new ArrayList<NodeList>();
    increment = inc;

    for(int i=0; i<fixPoint.size(); i++){
      float incX = (xx-fixP.get(i)[0])/inc;
      float incY = (yy-fixP.get(i)[1])/inc;
      Node fPt = new Node(fixP.get(i)[0], fixP.get(i)[1]);
      Node lastNode = new Node(fixP.get(i)[0] + incX*(inc-1), fixP.get(i)[1] + incY*(inc-1));
      lastNode.next=candy;
      list.add(new NodeList(fPt, lastNode));
     }
   }


  void createArr(){
    for(int i=0; i<list.size(); i++){
      float incX = (candy.x-fixPoint.get(i)[0])/increment;
      float incY = (candy.y-fixPoint.get(i)[1])/increment;
      for(int w = 1; w < increment-1; w ++){
        list.get(i).add(new Node(incX*w+fixPoint.get(i)[0],incY*w+fixPoint.get(i)[1]));
      }
    }created = true;

  }

  void display(){
    if(breakCandy){
      image(candyL, x-20, y, candyL.width/10, candyL.height/10);
      image(candyR, x+20, y, candyR.width/10, candyR.height/10);
    } else{
      if(drawCandy){
        imageMode(CENTER);
        image(candyImg, x, y, candyImg.width/10, candyImg.height/10);
      }
    if (!created){
      createArr();
    }
   for(int i = 0; i < fixPoint.size(); i++){
      list.get(i).processAll();
      list.get(i).display();
      list.get(i).last.attract(candy);
      stroke(102,51,0);
      strokeWeight(4);
      ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
   }
   candy.x += candy.dx;
   candy.y += candy.dy;
   candy.dy+=.3;

   addStar(300,400);
   starAchieved();
  //display spikes && stars

     spike = spi;

     if(level == 2){
       for(int i = 0; i < spike.length; i++){
       shatter(spike[i]);
       }
     }
  }



  //for regular string
  //void display(){
  //  if(drawCandy){
  //    imageMode(CENTER);
  //    image(candyImg, x, y, candyImg.width/10, candyImg.height/10);
  //  }

  //  for(int i = 0; i < fixPoint.size(); i++){
  //    stroke(102,51,0);
  //    strokeWeight(4);
  //    //replace this with the new draw rope method
  //    line(x, y, fixPoint.get(i)[0], fixPoint.get(i)[1]);
  //    ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
  //  }

  //  addStar(300,400);
  //    starAchieved();
  //    //display spikes && stars

  //}

  //void attract(float px, float py){
  //  float dist = dist(candy.x, candy.y, px, py) ;
  //  float force = (dist-100) * 0.05;
  //  float displacex = (px-candy.x) ;
  //  float displacey = (py-candy.y) ;
  //  dx += displacex * force / dist;
  //  dy += displacey * force / dist;
  //  dx *= 0.99;
  //  dy *= 0.99;
  //}

  //move for regular string
  //void move(){
  //  for(int i = 0; i < fixPoint.size(); i++){
  //    for(int t = 0; t < PointsX.get(i).length-1; t++){                                           //NEED MORE WORK
  //     this.attract(PointsX.get(i)[t], PointsY.get(i)[t], PointsX.get(i)[t+1], PointsY.get(i)[t+1]);
  //     //PointsX.get(i)[t]+=dx;
  //     //PointsY.get(i)[t]+=dy;
  //     //dy+=0.3;
  //    }
  //  }
  //  x+=dx;
  //  y+=dy;
  //  dy+=.3;
  //}

  //NEEDS MODIFICATIONS
  void cut(int count){
    for(int i = fixPoint.size()-1; i >= 0; i--){
      if(count == i){
        fixPoint.remove(i);
        list.remove(i);
      }
    }
    //disconnect the candy from the string
  }

  //logistics
  boolean dies(){
    return (candy.y >= 800) && drawCandy;
  }
  void candyAchieved(Doodle d){
    if(d.victory(this)){
      drawCandy = false;
    }//candy is removed when it falls within the radius of the doodle
  }

//star stuff
  void starAchieved(){
    if(abs(candy.x - starx) < 48 && abs(candy.y - stary) < 46){
      starScore++;
      drawStar=false;
    }
    //star is removed from screen and starScore + 1 when the candy touches the star
  }

  void addStar(float xs, float ys){
    if(drawStar == true){
      starx = xs;
      stary = ys;
      imageMode(CENTER);
      image(starImg, xs, ys, starImg.width/50, starImg.height/50);
    } else {
      starx = 0;
      stary = 0;
    }
  }

  int getScore(){
    return starScore;
    //return the current starScore.
  }

  void shatter(Spikes broken){
    //candy will shatter if it touches the spikes
    if(broken.x > x && (broken.x - x) < 5 || broken.x < x && (x - (broken.x + broken.sideLength*broken.numSpikes)) < 3){
      if(abs(y - broken.y) < broken.sideLength){
        grav = 1;
        breakCandy = true;
      }
    }

  }
}
