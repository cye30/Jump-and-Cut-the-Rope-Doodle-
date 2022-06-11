public class Button{
  
  color sqrtColor, sqrtHighlight;
  float sqrtSizeX = 45;
  float sqrtSizeY = 45;
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
    sqrtSizeX = size;
    sqrtSizeY = size;
  }
  public Button(float x, float y, float sizeX, float sizeY){
    sqrtX = x;
    sqrtY = y;
    sqrtColor = color(255);
    sqrtHighlight = color(243);
    sqrtSizeX = sizeX;
    sqrtSizeY = sizeY;
  }
  
  void display(){
    strokeWeight(5);
    stroke(0, 150, 0);
    
    if(overSqrt()){
      fill(sqrtHighlight);
    }else{
      fill(sqrtColor);
    }
    rect(sqrtX, sqrtY, sqrtSizeX, sqrtSizeY, 10);
    
  }
  
  boolean overSqrt(){
    return(mouseX>=sqrtX && mouseX<=sqrtX+sqrtSizeX && mouseY >= sqrtY && mouseY <= sqrtY+sqrtSizeY);
  }
 }
