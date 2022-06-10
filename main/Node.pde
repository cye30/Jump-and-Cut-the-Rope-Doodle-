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
  
  
  void attract(Node other){
    float dist = dist(x, y, other.x, other.y) ;
    float force = (dist - 100) * 0.05;
    float displacex = (x - other.x) ;
    float displacey = (y - other.y) ;
    other.dx += displacex * force / dist;
    other.dy += displacey * force / dist;
    other.dx*= 0.99;
    other.dy*= 0.99;
  }
  
  
  void move(){
    prev.attract(this);
    next.attract(this);
    
    x+=dx;
    y+=dy;
    
    dy+=.3;
  }

}
