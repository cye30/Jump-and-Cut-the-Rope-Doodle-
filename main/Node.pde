public class Node{
  float x, y, dx, dy;
  Node prev, next;
  
  public Node(float x_, float y_){
    x=x_;
    y=y_;
    dx=0;
    dy=0;
  }
  
  void display(){
    if(prev!=null){
      line(x, y, prev.x, prev.y);
    }
    if(next!=null){
      line(x, y, prev.x, prev.y);
    }
  }
  
  
  void attract(){}
  
  
  void move(){}

}
