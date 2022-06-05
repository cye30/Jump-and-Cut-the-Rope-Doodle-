public class Win{
  boolean candyObtained;
  PFont mono;

  
  public Win(){
    
  }
  
  void display(){
    stroke(0,150,0);
    fill(0,150,0);
    rect(125,150,350,500,10);
    fill(255);
    textSize(70);
    //textFont(mono);
    text("YOU WIN!", 140,240);
  }
  
  /*void restart(){
    
  }
  
  void won(){
    
  }
  
  void displayStars(){
    
  }
  
  void nextLevel(){
    
  }
  
  void menu(){
    
  }*/
}
