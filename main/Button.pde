public class Button{
  
  color sqrtColor, sqrtHighlight;
  float sqrtSize = 45;
  float sqrtX, sqrtY;
  
  public Button(float x, float y){
    sqrtX = x;
    sqrtY = y;
    sqrtColor = color(255);
    sqrtHighlight = color(243);
  }
  public Button(float x, float y, float size){
    sqrtX = x;
    sqrtY = y;
    sqrtColor = color(255);
    sqrtHighlight = color(243);
    sqrtSize = size;
  }
  
  void display(){
    strokeWeight(5);
    stroke(0, 150, 0);
    
    if(overSqrt()){
      fill(sqrtHighlight);
    }else{
      fill(sqrtColor);
    }
    rect(sqrtX, sqrtY, sqrtSize, sqrtSize, 10);
    
  }
  
  boolean overSqrt(){
    return(mouseX>=sqrtX && mouseX<=sqrtX+sqrtSize && mouseY >= sqrtY && mouseY <= sqrtY+sqrtSize);
  }
 }
