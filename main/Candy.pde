public class Candy{
  float dx,dy,x,y,radius;
  float[][] fixPoint,star;
  int starScore;
  color c;
  boolean status;
  //Spike[] spikes; later methods
  //Bubble[] bubbles;
  
  public Candy(float xx, float yy, float rad, float[][] fixP){
    x = xx;
    y = yy;
    radius = rad;
    fixPoint = fixP;
  }
  
  void display(){
    fill(200,100,200);
    ellipse(x,y,radius*2,radius*2);
    for(int i = 0; i < fixPoint.length; i++){
      line(x, y, fixPoint[i][0], fixPoint[i][1]); //makes line from Candy to fixed points
      fill(0);
      ellipse(fixPoint[i][0],fixPoint[i][1],5,5);
    }
    //display spikes && stars
  }
  
  void move(){
    x += dx;
    y += dy;
  }
  void gravity(){
    dy += 0.35;
  }
  
  int[] addFixedPoint(float x, float y){
    fixPoint.add({{x},{y}});
  }  
  /*void shatter(){
    : candy will shatter if it touches the spikes
  }
  void cut(){
    : disconnect the candy from the string
  }
  void starAchieved(){
    : star is removed from screen and starScore + 1 when the candy touches the star
  }
  int getScore(){
    : return the current starScore.
  }
  void addStar(float x, float y){
    : create stars at the specified location
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
