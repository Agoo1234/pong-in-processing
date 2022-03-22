// In this tab, you must write code in:
//
// * move()

class Player extends Paddle {
  public Player(float x, float y, float w, float h, PVector vector, color c, boolean computer) {
    super(x, y, w, h, vector, c, computer);
  }

// TODO: move()
//
// The player's move() method should work as follows:
// 1. Change the y-coordinate of the paddle (x-coordinate remains fixed)
// 2. Check to see if the new y-coordinate means that the paddle is touching the
//    top or bottom wall.  If it is:
//       2A. Set the paddle's vector to (0, 0); such a vector exists near the top
//           of the first Processing tab
//       2B. Set the y-coordinate so that the edge of the paddle is touching the wall
  public void move() {
    if (intersectsHorizontal()) {
      if (getY() > 0) setY(getY()-PADDLE_SPEED);
      else setY(getY()+PADDLE_SPEED);
    }

    if (isComputer()) {
      if (state == GAME_STATE.IN_PLAY && isComputer()) {
      float targetHitY = getY() + height/2;
      float targetHitX = getX() + width/2;
      float projectedY = ball.getY() + height/2;
      //if(targetHitY != projectedY) {
      if(!(ball.getY() - ball.getRadius() <= getY()+getHeight()/2 - 5 && ball.getY() - ball.getRadius() >= getY()-getHeight()/2 + 5 || ball.getY() + ball.getRadius() <= getY()+getHeight()/2 - 5 && ball.getY() + ball.getRadius() >= getY()-getHeight()/2 + 5)) {
        int multiplier;
        if (targetHitY > projectedY) multiplier = -1;
        else multiplier = 1;
        getVector().set(getVector().x, PADDLE_SPEED * multiplier);
        //vector.set(vector.x, height/2 + ball.getY());
      }
      else getVector().set(0,0); // not NO_MOVE, because this will control computer too for some reason
      }
      if (state == GAME_STATE.GAME_OVER) getVector().set(0,0);
      else getVector().set(getVector().x, getVector().y);
    }
    
    setY(getY() + getVector().y);
  }
}
