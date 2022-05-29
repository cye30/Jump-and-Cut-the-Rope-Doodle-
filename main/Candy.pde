public class Candy{
  float dx,dy,x,y,radius;
  float[][] fixPoint,star;
  int starScore;
  color c;
  boolean status;
  boolean drawStar=true;
  float starx;
  float stary;
  //Spike[] spikes; later methods
  //Bubble[] bubbles;
  
  public Candy(float xx, float yy, float rad, float[][] fixP){
    x = xx;
    y = yy;
    radius = rad;
    fixPoint = fixP;
    dx = 0;
    dy = 0;
  }
  
  void display(){
    imageMode(CENTER);
    image(candyImg, x, y, candyImg.width/10, candyImg.height/10);
    for(int i = 0; i < fixPoint.length; i++){
      stroke(102,51,0);
      strokeWeight(4);
      line(x, y, fixPoint[i][0], fixPoint[i][1]); //makes line from Candy to fixed points
      ellipse(fixPoint[i][0],fixPoint[i][1],10,10);
    }
    addStar(445,400);
    starAchieved();
    //display spikes && stars
  }
  
  void attract(float px, float py){//modify this
    float dist = dist(x, y, px, py) ;
    float force = (dist) * .01;
    float displacex = (x - px) ;
    float displacey = (y - py) ;
    dx += displacex * force / dist;
    dy += displacey * force / dist;
    dx *= 0.2;
    dy *= 0.2;
    dx += dx;
    dy += dy;
  }
  
  void move(){
    /*for(int i = 0; i < fixPoint.length; i++){
      attract(fixPoint[i][0], fixPoint[i][1]);
    }*/ 
    x+=dx;
    y+=dy;
    dy += gravity;
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
  
  void starAchieved(){
    if(x - starx < 48 && y - stary < 46){
      starScore++;
      drawStar=false;
    }
    //star is removed from screen and starScore + 1 when the candy touches the star
  }
  int getScore(){
    return starScore;
    //return the current starScore.
  }
  
  /*void shatter(){
    : candy will shatter if it touches the spikes
  }
  void cut(){
    : disconnect the candy from the string
  }
  void addSpike(Spike s){
    : add a specified spike into the spike array
  }
  void addBubble(Bubble b){
    : add a specified bubble into the bubble array. 
  }
  void inBubble(){
    :remove the gravitational force and  modify the dy of the candy based on bubbleFloat()
  }*/
  
}
