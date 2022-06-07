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
  Spikes[] spike;
  //Bubble[] bubbles;
  boolean drawCandy = true;
  boolean breakCandy = false;
  float grav;
  
  public Candy(float xx, float yy, float rad, ArrayList<float[]> fixP,Spikes[] spi){
    x = xx;
    y = yy;
    radius = rad;
    fixPoint = fixP;
    dx = 0;
    dy = 0;
    starScore = 0;
    spike = spi;
    grav = 0.3;
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
      
      shatter();
    
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
    dy += grav;
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
  
  void cut(int count){
    for(int i = fixPoint.size()-1; i >= 0; i--){
      if(count == i){
        fixPoint.remove(i);
      }
    }
    //disconnect the candy from the string
  }
  
  boolean dies(){
    return (y >= 800) && drawCandy;
  }
  
  void shatter(){
    //candy will shatter if it touches the spikes
    for(int i = 0; i < spike.length; i++){
      if(spike[i].x > x && (spike[i].x - x) < 5 || spike[i].x < x && (x - (spike[i].x + spike[i].sideLength*spike[i].numSpikes)) < 3){
        if(abs(y - spike[i].y) < spike[i].sideLength){
          grav = 1;
          y -= 20;
        }
      }
    }
    
  }
  /*
  void addBubble(Bubble b){
    : add a specified bubble into the bubble array. 
  }
  void inBubble(){
    :remove the gravitational force and  modify the dy of the candy based on bubbleFloat()
  }*/
}
