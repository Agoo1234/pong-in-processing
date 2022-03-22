// In this tab, DO NOT CHANGE ANY CODE

class Paddle {
  private float x;  // x-coordinate of center of paddle
  private float y;  // y-coordinate of center of paddle
  private float w;  // width of paddle (x direction)
  private float h;  // height of paddle (y direction)
  private PVector vector;
  private color fillColor;
  private int score = 0;
  private boolean computer;
  
  public Paddle(float x, float y, float w, float h, PVector vector, color c, boolean computer) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vector = vector;
    this.fillColor = c;
    this.computer = computer;
  }
  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() { return h; }
  public void setHeight(float n) { this.h = n; }
  public void setX(float x) { this.x = x; }
  public void setY(float y) { this.y = y; }
  public PVector getVector() { return vector; }
  public void setVector(PVector v) { vector = v; }
  public int getScore() { return score; }
  public void setScore(int score) { this.score = score; }
  public void scorePoint() { score++; }
  public boolean isComputer() { return computer; }
  public void setComputer(boolean torf) { this.computer = torf; }
  
  public boolean intersectsHorizontal() {
    return (getY()+getHeight()/2 >= height/2) ||
           (getY()+(height/2)-getHeight()/2 <= 0);
  }

  
  public void move() {
    if (intersectsHorizontal()) {
      if (y > 0) y = getY() - PADDLE_SPEED;
      else y = getY() + PADDLE_SPEED;
    }
    else y = y;
    if (state == GAME_STATE.IN_PLAY && isComputer()) {
      float targetHitY = y + height/2;
      float targetHitX = x + width/2;
      float projectedY = ball.getY() + height/2;
      //if(targetHitY != projectedY) {
      if(targetHitY != height/2 + ball.getY()) {
        int multiplier;
        if (targetHitY > projectedY) multiplier = -1;
        else multiplier = 1;
        vector.set(vector.x, PADDLE_SPEED * multiplier);
        //vector.set(vector.x, height/2 + ball.getY());
      }
      else vector.set(0,0); // not NO_MOVE, because this will control computer too for some reason
    }
    if (state == GAME_STATE.GAME_OVER) vector.set(0,0);
    else vector.set(vector.x, vector.y);

    setY(y + vector.y);
  }


  
  public void changeVerticalSpeed(int n) {
    vector.set(vector.x, vector.y + n);
  }

  
  public void setVerticalSpeed(int n) {
    vector.set(vector.x, n);
  }

  public float hitFactor() {
    return (ball.getY() - getY()) / getHeight();
  }
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    rect(x + width/2, y + height/2 -getHeight()/2, getWidth(), getHeight());
  }
}
