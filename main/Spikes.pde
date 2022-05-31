public class Spikes{
  float x, y;
  float numSpikes;
  final int sideLength;
  
  public Spikes(float x_, float y_, float nums){
    x = x_;
    y = y_;
    sideLength = 3;
    numSpikes = nums;
  }
  
  void display(){
    drawSpikes(numSpikes);
  }
  
  void drawSpikes(float nums){
    for(int i = 0; i < nums; i++){
      int val = i * sideLength;
      triangle(x + val, y, x+sideLength + val, y, x+(sideLength/2) + val, y+1.2*sideLength/2);
    }
  }
  
}
