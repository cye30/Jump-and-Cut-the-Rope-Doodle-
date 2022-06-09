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
  
  ArrayList<float[]> PointsX = new ArrayList<float[]>();
  ArrayList<float[]> PointsY = new ArrayList<float[]>();
  
  
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
      //replace this with the new draw rope method
      //line(x, y, fixPoint.get(i)[0], fixPoint.get(i)[1]);
      drawLine(fixPoint.get(i)[0], fixPoint.get(i)[1]); //makes line from Candy to fixed points
      ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
    }
    
    addStar(300,400);
      starAchieved();
      //display spikes && stars
    
  }
  
  
  void drawLine(float fx, float fy){ //access through the arraylist
    float incX = abs(fx-x)/10;
    float incY = abs(fy-y)/10;
    float[] holderX = new float[10];
    float[] holderY = new float[10];
    holderX[0] = fx;
    holderY[0] = fy;
    for(int i = 1; i<10; i++){
      float secX = fx+(incX*(i));
      float secY = fy+(incY*(i));
      holderX[i] = secX;
      holderY[i] = secY;
      line(holderX[i], holderY[i], holderX[i-1], holderY[i-1]);
    }
    PointsX.add(holderX);
    PointsY.add(holderY);
  }
  
  
  //attract #1
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
  
  //attract #2
  void attract(float px, float py, float qx, float qy){//modify this
    float dist = dist(qx, qy, px, py) ;
    float force = (dist-100) * 0.05;
    float displacex = (px-qx) ;
    float displacey = (py-qy) ;
    dx += displacex * force / dist;
    dy += displacey * force / dist;
    dx *= 0.99;
    dy *= 0.99;
  }
  
  void move(){
    for(int i = 0; i < fixPoint.size(); i++){
      for(int t = 0; t < PointsX.get(i).length-1; t++){                                           //NEED MORE WORK
       this.attract(PointsX.get(i)[t], PointsY.get(i)[t], PointsX.get(i)[t+1], PointsY.get(i)[t+1]); 
       //PointsX.get(i)[t]+=dx;
       //PointsY.get(i)[t]+=dy;
       //dy+=0.3;
      }
    }
    x+=dx;
    y+=dy;
    dy+=.3;
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
