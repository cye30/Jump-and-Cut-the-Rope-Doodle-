public class Candy{
  float dx,dy,x,y,radius;
  float[][] star;
  ArrayList<float[]> fixPoint;
  int starScore;
  color c;
  boolean status;
  boolean drawStar=true;
  float starx;
  float stary;
  //Spike[] spikes; later methods
  //Bubble[] bubbles;
  boolean drawCandy = true;
  
  public Candy(float xx, float yy, float rad, ArrayList<float[]> fixP){
    x = xx;
    y = yy;
    radius = rad;
    fixPoint = fixP;
    dx = 0;
    dy = 0;
    starScore = 0;
  }
  
  void display(){
    if(drawCandy){
      imageMode(CENTER);
      image(candyImg, x, y, candyImg.width/10, candyImg.height/10);
    }
    
    for(int i = 0; i < fixPoint.size(); i++){
      stroke(102,51,0);
      strokeWeight(4);
      line(x, y, fixPoint.get(i)[0], fixPoint.get(i)[1]); //makes line from Candy to fixed points
      ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
    }
    
    addStar(300,400);
      starAchieved();
      //display spikes && stars
    
  }
  
  void attract(float px, float py){//modify this
    float dist = dist(x, y, px, py) ;
    float force = (dist-100) * 0.05;
    float displacex = (px-x) ;
    float displacey = (py-y) ;
    dx += displacex * force / dist;
    dy += displacey * force / dist;
    dx *= 0.99;
    dy *= 0.99;
  }
  
  void move(){
    for(int i = 0; i < fixPoint.size(); i++){
      this.attract(fixPoint.get(i)[0], fixPoint.get(i)[1]);
    }
    x+=dx;
    y+=dy;
    dy += 0.3;
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
  
  void candyAchieved(Doodle d){
    if(d.victory(this)){
      drawCandy = false;
    }//candy is removed when it falls within the radius of the doodle
  }
  
  void starAchieved(){
    if(abs(x - starx) < 48 && abs(y - stary) < 46){
      starScore++;
      drawStar=false;
    }
    //star is removed from screen and starScore + 1 when the candy touches the star
  }
  
  int getScore(){
    return starScore;
    //return the current starScore.
  }
  
  void cut(){
    for(int i = 0; i < fixPoint.size(); i++){
      if(abs(mouseX - fixPoint.get(i)[0]) < 5  && abs(mouseY - fixPoint.get(i)[1]) < 5){
        fixPoint.remove(i);
      }
    }
    //disconnect the candy from the string
  }
  
  boolean dies(){
    return (y >= 800) && drawCandy;
  }
  
  /*void shatter(){
    : candy will shatter if it touches the spikes
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
