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
  
  NodeList[] list;
  
  //ArrayList<Node[]> nodeArr = new ArrayList<Node[]>();
  
  
  //create candy
  public Candy(float xx, float yy, float rad, ArrayList<float[]> fixP){
    x = xx;
    y = yy;
    radius = rad;
    fixPoint = fixP;
    dx = 0;
    dy = 0;
    starScore = 0;
    list = new NodeList[fixPoint.size()];
    for(int i=0; i<list.length; i++){
      Node fPt = new Node(fixP.get(i)[0], fixP.get(i)[1]);
      list[i] = new NodeList(fPt, x, y);
    }
   
  }
  
  void createList(int inc){
     text("size of list is" + list.length, 350, 350);
    for(int i = 0; i < list.length; i++){
      float incX = (list[i].last.x-list[i].first.x)/inc;
      float incY = (list[i].last.y-list[i].first.y)/inc;
      for(int w=1; w < inc; w++){
        Node newNode = new Node(w*incX + list[i].first.x, w*incY + list[i].first.y);
        list[i].add(newNode);
      }
      //list[i].display();
    }
    created = true;
  }
  
  void display(int inc){
    if(drawCandy){
      imageMode(CENTER);
      //image(candyImg, list[0].last.x, list[0].last.y, candyImg.width/10, candyImg.height/10);
    }
    
    //if(!created){
      createList(inc);
    //}
    
    for(int i = 0; i < list.length; i++){
      list[i].processAll();
      list[i].display();
      stroke(102,51,0);
      strokeWeight(4);
      ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
    }
    
  }

  
  //help constructs the arraylist necessary for organization and easier access
  //void createArr(float fx, float fy, float cx, float cy){
  //  float incX = (cx-fx)/10;
  //  float incY = (cy-fy)/10;
  //  Node[] storage = new Node[11];
  //  for(int i = 0; i <= 10; i++){
  //    storage[i] = new Node(fx+incX*i, fy+incY*i);
  //  }
  //  nodeArr.add(storage);
  //}
  
  //void display(){
  //  if(drawCandy){
  //    imageMode(CENTER);
  //    image(candyImg, x, y, candyImg.width/10, candyImg.height/10);
  //  }
    
    //int countyCount = 0;
    //for(Node[] n : nodeArr){ //loop through each fix point
    //  countyCount++;
    //  text("n is equal to "+ countyCount , 400, 450);
    //  int w = 0;
    //  while(w<n.length){ //loop through each node
    //    text("w is equal to "+ w , 400, 400);
    //    if(w==0){
    //      //nothing is to be done
    //    }else if(w==n.length-1){
    //      n[w-1].attract(n[w]);
    //    }else{
    //      n[w+1].attract(n[w]);
    //      n[w-1].attract(n[w]);
    //    }
    //    n[w].move();
    //    if(w+1 <= n.length-1){
    //      n[w].display(n[w+1].x, n[w+1].y);
    //    }
    //    w++;
    //  }
    //}
    
  //  for(int i = 0; i < fixPoint.size(); i++){
  //    stroke(102,51,0);
  //    strokeWeight(4);
  //    ellipse(fixPoint.get(i)[0],fixPoint.get(i)[1],10,10);
  //  }
    
  //  addStar(300,400);
  //    starAchieved();
  //    //display spikes && stars
  //}
  
  
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
  
  //NOT WORKING
  //void drawLine(float fx, float fy){ //access through the arraylist
  //  float incX = abs(fx-x)/10;
  //  float incY = abs(fy-y)/10;
  //  float[] holderX = new float[10];
  //  float[] holderY = new float[10];
  //  holderX[0] = fx;
  //  holderY[0] = fy;
  //  for(int i = 1; i<10; i++){
  //    float secX = fx+(incX*(i));
  //    float secY = fy+(incY*(i));
  //    holderX[i] = secX;
  //    holderY[i] = secY;
  //    line(holderX[i], holderY[i], holderX[i-1], holderY[i-1]);
  //  }
  //  PointsX.add(holderX);
  //  PointsY.add(holderY);
  //}
  
  
  //attract for regular string
  //void attract(float px, float py){//modify this
  //  float dist = dist(x, y, px, py) ;
  //  float force = (dist-100) * 0.05;
  //  float displacex = (px-x) ;
  //  float displacey = (py-y) ;
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
      }
    }
    //disconnect the candy from the string
  }
  
  //logistics
  boolean dies(){
    return (y >= 800) && drawCandy;
  }
  void candyAchieved(Doodle d){
    if(d.victory(this)){
      drawCandy = false;
    }//candy is removed when it falls within the radius of the doodle
  }
  
//star stuff
  void starAchieved(){
    if(abs(x - starx) < 48 && abs(y - stary) < 46){
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
