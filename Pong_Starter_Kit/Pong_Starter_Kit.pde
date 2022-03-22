`// In this tab, you must write code in:
//
// * showScores()
// * updateScores()
//
// Note: The ball does not actually get created until the SPACE key is hit.
// See the keypresses tab for construction of the ball.

Ball ball;        
Paddle computer;
Player player;
enum GAME_STATE { IN_PLAY, NO_PLAY, BEFORE_GAME, GAME_OVER };
GAME_STATE state = GAME_STATE.BEFORE_GAME;  // Keeps track of state of game
PVector NO_MOVE = new PVector(0, 0);
int PADDLE_SPEED = 7;
int BALL_SPEED = 8;
final int POINTS_NEEDED_TO_WIN = 10;
PFont font;
PFont gameOverFont;
int WHEREBALL = 0;


int debuggingCounter = 0;
final int DEBUGGING_TICKS = 100;

void setup() {
  //size(1024, 768);
  size(displayWidth, displayHeight);
  ellipseMode(RADIUS);
  computer = new Paddle(width/2 - 100, 0, 15, height/8, new PVector(0,0), color(#ffffff), true);
  player = new Player(-width/2 + 100, 0, 15, height/8, NO_MOVE, color(#ffffff), false);

  // For scoring
  font = createFont("bit5x3.ttf", 72);
  gameOverFont = createFont("bit5x3.ttf", 100);
  textFont(font);
  textAlign(CENTER, CENTER);  // Specify center of where text should be printed
}

void draw() {
  background(#000000);
  // Translation removed because there is a fair amount of text that is easier
  // to draw if the origin is at top left
  //translate(width/2, height/2);
  
  debuggingCounter = (debuggingCounter + 1) % DEBUGGING_TICKS;
  if (debuggingCounter == 0) {
    printState();
    System.out.println(ball);
  }
  for (int i = 0; i < height/5; i++) {
      if (i%2 == 0) {
        fill(255);
      } else {
        fill(0);
      }
      rect(width/2, i*8, 6, 8);
    }
  showScores();  
  moveObjects();
  drawObjects();
}

public void moveObjects() {
  // The ball shouldn't move unless it is in play
  if (state == GAME_STATE.IN_PLAY) ball.move();
  computer.move();
  player.move();
}

    
public void drawObjects() {
  // Don't draw a ball until a game has started
  if (state != GAME_STATE.BEFORE_GAME) ball.draw();
  computer.draw();
  player.draw();
}

// TODO: showScores()
public void showScores() {
  // Make sure the scores are correct
  updateScores();
  
  // show scores instead of "hi"
  fill(#ffffff);
  text(player.getScore(), 200, 50); 
  text(computer.getScore(), width - 200, 50); 
  
  // Display "GAME OVER" if the game is over
  // (Changing the game state to indicate that the game is over is handled in
  // updateScores(), below; you just need to check the game state and display text
  if (state == GAME_STATE.GAME_OVER) {
      fill(#ffffff);
      textFont(gameOverFont);
      text("GAME OVER", width/2, height/2);
      textSize(64);
      if(player.getScore() > computer.getScore()) text("YOU WIN", width/2, height/2 + 100);
      else text("COMPUTER WINS", width/2, height/2 + 100);
   }
  // YOUR CODE HERE
}

// TODO: updateScores()
public void updateScores() {
  // If the ball is not in play, there is no score to update, so just return
  if (state != GAME_STATE.IN_PLAY) return;
  
  // If the ball is in play, then check to see if it has hit a wall.
  // If so, then:
  // 1. Stop the ball (think vector)
  // 2. Change the state of the game so the ball is no longer in play
  // 3. Figure out who scored and give that side a point.
  // 4. Check to see if the game is over; if so, change the game state accordingly
  if (ball.intersectsVertical()) {
  state = GAME_STATE.NO_PLAY;
  if (ball.getX() < CENTER) {
    WHEREBALL++;
    computer.setScore(computer.getScore() + 1);
    if (computer.getScore() != POINTS_NEEDED_TO_WIN) {
      state = GAME_STATE.IN_PLAY;
      ball.setVector(initializeBallVector());
    }
    else {
      state = GAME_STATE.GAME_OVER;
      WHEREBALL = 0;
    }
  }
  else if (ball.getX() >= CENTER){
    WHEREBALL++;
    player.setScore(player.getScore() + 1);
    if (player.getScore() != POINTS_NEEDED_TO_WIN) {
      state = GAME_STATE.IN_PLAY;
      ball.setVector(initializeBallVector());
    }
    else {
      state = GAME_STATE.GAME_OVER;
      WHEREBALL = 0;
    }
  }
  ball.setX(0);
  ball.setY(0);
}
}

void printState() {
  switch(state) {
    case IN_PLAY: System.out.println("IN PLAY"); break;
    case NO_PLAY: System.out.println("NO PLAY"); break;
    case BEFORE_GAME: System.out.println("BEFORE GAME"); break;
    case GAME_OVER: System.out.println("GAME OVER"); break;
    default: System.out.println("UNKNOWN"); break;
  }
}
