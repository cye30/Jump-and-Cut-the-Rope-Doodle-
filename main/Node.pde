public class Node{
  float x, y, dx, dy;
  
  public Node(float x_, float y_){
    x=x_;
    y=y_;
    dx=0;
    dy=0;
  }
  
  void display(float x_, float y_){
     line(x, y, x_, y_);
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
    x+=dx;
    y+=dy;
    dy+=.3;
  }
}
