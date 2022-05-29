public class Button{
  
  color sqrtColor, sqrtHighlight;
  boolean sqrtOver = false;
  int sqrtSize = 45;
  float sqrtX, sqrtY;
  
  public Button(float x, float y){
    sqrtX = x;
    sqrtY = y;
    sqrtColor = color(225);
    sqrtHighlight = color(204);
  }
  
  void display(){
    strokeWeight(16);
    stroke(0, 150, 0);
    
    if(sqrtOver){
      fill(sqrtHighlight);
    }else{
      fill(sqrtColor);
    }
    rect(sqrtX, sqrtY, sqrtSize, sqrtSize, 16);
    
  }
  
  boolean overSqrt(){
    return(mouseX>=sqrtX && mouseX<=sqrtX+sqrtSize && mouseY >= sqrtY && mouseY <= sqrtY+sqrtSize);
  }
 }
