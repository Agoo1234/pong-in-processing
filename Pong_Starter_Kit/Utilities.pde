// In this tab, DO NOT CHANGE ANY CODE
// 
// YOU MAY ADD NEW METHODS, BUT DO NOT CHANGE ANY EXISTING CODE IN THIS TAB
ArrayList<String> keyspressed = new ArrayList<String>();

public double square(double x) {
  return x*x;
}
public boolean between(double a, double b, double c) {
  return (a >= b) && (a <= c);
}

public PVector initializeBallVector() {
  int PosOrNeg = (WHEREBALL%2 == 0) ? 1 : -1;
  return new PVector(PosOrNeg*BALL_SPEED,random(-2,2));
}

public void regKey(String key) {
  String ultramodekeys = "38 38 40 40 37 39 37 39 b a \n"; // up up down down left right left right b a enter (\n = enter)
  String bigpaddlekeys = "40 40 38 38 37 39 37 39 b a \n"; // down down up up left right left right b a enter
  String playformekeys = "38 40 38 40 37 39 37 39 b a \n"; // up down up down left right left right b a enter
  keyspressed.add(key);
  String currentkeys = "";
  if (keyspressed.size() >= 11) {
    for (int i = 0; i<keyspressed.size(); i++) {
      currentkeys = currentkeys + keyspressed.get(i) + " ";
    }
    if (currentkeys.contains(ultramodekeys)) {
      BALL_SPEED = 16;
      PADDLE_SPEED = 11;
      System.out.println("ULTRA FAST MODE ACTIVATED");
      for (int i = 0; i < keyspressed.size(); i++) {
        keyspressed.remove(0);
      }
    }
    else if (currentkeys.contains(bigpaddlekeys)) {
      System.out.println("SUPER BIG PADDLE MODE ACTIVATED");
      player.setHeight(height-10);
      for (int i = 0; i < keyspressed.size(); i++) {
        keyspressed.remove(0);
      }
    }

    else if (currentkeys.contains(playformekeys)) {
      System.out.println("PLAY FOR ME MODE ACTIVATED");
      player.setComputer(true);
      for (int i = 0; i < keyspressed.size(); i++) {
        keyspressed.remove(0);
      }
    }
  }
}

