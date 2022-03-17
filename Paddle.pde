// In this tab, DO NOT CHANGE ANY CODE

class Paddle {
  private float x;  // x-coordinate of center of paddle
  private float y;  // y-coordinate of center of paddle
  private float w;  // width of paddle (x direction)
  private float h;  // height of paddle (y direction)
  private PVector vector;
  private color fillColor;
  private int score = 0;
  
  public Paddle(float x, float y, float w, float h, PVector vector, color c) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.vector = vector;
    this.fillColor = c;
  }
  
  public float getX() { return x; }
  public float getY() { return y; }
  public float getWidth() { return w; }
  public float getHeight() { return h; }
  public void setX(float x) { this.x = x; }
  public void setY(float y) { this.y = y; }
  public PVector getVector() { return vector; }
  public void setVector(PVector v) { vector = v; }
  public int getScore() { return score; }
  public void setScore(int score) { this.score = score; }
  public void scorePoint() { score++; }
  
  public boolean intersectsHorizontal() {
    return (getY()+getHeight()/2 >= height/2) ||
           (getY()+(height/2)-getHeight()/2 <= 0);
  }
  
  public void move() {
    if (intersectsHorizontal()) {
      vector.set(vector.x, -vector.y);
    }
    
    y = getY() + vector.y;
  }
  
  public void changeVerticalSpeed(int n) {
    vector.set(vector.x, vector.y + n);
  }
  
  public void setVerticalSpeed(int n) {
    vector.set(vector.x, n);
  }
    
  public void draw() {
    fill(fillColor);
    stroke(#000000);
    rect(x + width/2, y + height/2 -getHeight()/2, getWidth(), getHeight());
  }
}
