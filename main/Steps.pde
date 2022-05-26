public class Steps{
  float x,y;
  float leng;
  float wid;
  
  public Steps(float m,float n){
    x = m;
    y = n;
    leng = 150;
    wid = 20;
  }
  
  void drawStep(){
    fill(0,150,0);
    rect(x,y,leng,wid);
  }
}
