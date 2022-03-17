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
      player.setVerticalSpeed(-3);
    } else if (keyCode == DOWN) {
      player.setVerticalSpeed(3);
    }
  } else if (key == ' ') {
    if (state != GAME_STATE.IN_PLAY) {
      if (state == GAME_STATE.GAME_OVER) {
        computer.setScore(0);
        player.setScore(0);
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
  }
}
