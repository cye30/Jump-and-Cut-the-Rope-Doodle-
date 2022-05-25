Candy cane;
void setup(){
  size(900,1300);
  background(225);
  float[][] points = {{400,300},{300,400}};
  cane = new Candy(400,400,30,points);
}
void draw(){
  cane.display();
}
