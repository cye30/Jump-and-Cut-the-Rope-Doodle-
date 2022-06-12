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
    displayStars();
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
  
  void restart(){
    //restart icons
    triangle(105,53,105,72,120,62);
    image(restartB, restart.sqrtX, restart.sqrtY, restartB.width/20, restartB.height/20);
  }
}
