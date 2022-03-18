
// In this tab, DO NOT CHANGE ANY CODE
//
// UP and DOWN arrow keys are used to move the player's paddle
// SPACE is used to put a new ball in play
//
// In Processing, when a key is pressed, the keyPressed() method is automatically
// called (if one exists).

void keyPressed() {
  if (key == CODED) {
    if (keyCode == UP) {
      player.setVerticalSpeed(-PADDLE_SPEED);
    } else if (keyCode == DOWN) {
      player.setVerticalSpeed(PADDLE_SPEED);
    }
  } else if (key == ' ') {
    if (state != GAME_STATE.IN_PLAY) {
      if (state == GAME_STATE.GAME_OVER) {
        computer.setScore(0);
        player.setScore(0);
        computer.setY(0);
        player.setY(0);
        PADDLE_SPEED = 3;
        BALL_SPEED = 7;
      }
      ball = new Ball(0, 
                      random(-height/2 + 100, 
                      height/2 - 100), 
                      7, 
                      initializeBallVector(), 
                      color(#ff0000));
      state = GAME_STATE.IN_PLAY;
    }
  }
  
}

void keyReleased() {
  if (key == CODED) {
    if (keyCode == UP || keyCode == DOWN) {
       player.setVerticalSpeed(0);
     }
    regKey(""+keyCode);
    }
  else regKey("" + key);
}
