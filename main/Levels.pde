public class Levels{
  
  public Levels(){
  }
  
  void celebrate(){
    if (!candyBroken) {
      if (doodle.victory(candy) || pageMode == winPg) {
        if (counter < 5) {
          pageMode = winPg;
          monster.clear();
          if (onStep()) {
            counter++;
            doodle.jump();
            doodle.gravity();
            doodle.move();
            //sprinkles!!
            stars.add(new Sprinkle(doodle.x, doodle.y+120, -5));
            stars.add(new Sprinkle(doodle.x, doodle.y+120, 5));
            stars.add(new Sprinkle(doodle.x, doodle.y+70, 8));
            stars.add(new Sprinkle(doodle.x, doodle.y+70, -8));
          }
          for (Sprinkle s : stars) {
            s.gravity();
            s.move();
            s.display();
          }
        } else {
          //draw win tab
          won.display();
          image(doodleAngelLeft, 300, 450, 4 * doodleAngelLeft.width/12, 4 * doodleAngelLeft.height/12);
          for (Button m : buttonWin) {
            m.display();
            imageMode(CORNER);
            image(restartB, restartWin.sqrtX, restartWin.sqrtY, restartB.width/15, restartB.height/15);
            image(menuButton, menu.sqrtX + 9, menu.sqrtY + 13, menuButton.width/20, menuButton.height/20);
            strokeWeight(8);
            triangle(nextLev.sqrtX + 23, nextLev.sqrtY + 20, nextLev.sqrtX + 23, nextLev.sqrtY + 50, nextLev.sqrtX + 48, nextLev.sqrtY + 35);
          }
        }
      }
     } if (doodle.dies()||candy.dies()) {
        music.pause();
        setup();
        for (int i = 0; i<monster.size(); i++) {
          monster.set(i, new Monsters(monster.get(i).monsStartX, monster.get(i).monsStartY, 0));
        }
        skipStep = false;
        textSize(10);
        text("yo mama",500,700);
      }
  }
  
}
