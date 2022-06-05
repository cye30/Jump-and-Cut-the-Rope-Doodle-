public class Win{
  boolean candyObtained;
  PFont mono;
  
Button restart = new Button(160, 540);
Button menu = new Button(300, 540);
Button nextLev = new Button(400, 540);

  
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
    displayStars();
    restart.display();
    menu.display();
    nextLev.display();
  }
  
  void displayStars(){
    imageMode(CENTER);
    int add = 0;
    for(int i = 0; i < candy.getScore(); i++){
      add = i*116;
      image(starImg, 180+add, 290, starImg.width/30, starImg.height/30);
    }
    for(int i = 0; i < 3-candy.getScore(); i++){
      add = (candy.getScore()+i)*116;
      image(starUImg, 180+add, 290, starImg.width/30, starImg.height/30);
    }
  }
  
  /*void restart(){
    
  }
  
  void won(){
    
  }
  
  void nextLevel(){
    
  }
  
  void menu(){
    
  }*/
}
