public class Steps{
  float x,y;
  
  public Steps(float m,float n){
    x = m;
    y = n;
  }
  
  void drawStep(){
    fill(0,150,0);
    rect(x,y,150,20);
  }
}
