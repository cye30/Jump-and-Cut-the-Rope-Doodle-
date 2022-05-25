  public class Candy{
    float dx,dy,x,y,radius;
    float[][] fixPoint,star;
    int starScore;
    color c;
    boolean status;
    //Spike[] spikes; later methods
    //Bubble[] bubbles;
    
    void display(){
      fill(c);
      ellipse(x,y,radius*2,radius*2);
      for(int i = 0; i < fixPoint.length; i++){
        line(x, y, fixPoint[i][0], fixPoint[i][1]); //makes line from Candy to fixed points
      }
    }
    
  }
