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
  return new PVector(BALL_SPEED,random(-2,2));
}

public void regKey(String key) {
  String targetkeys = "38 38 40 40 37 39 37 39 b a \n";
  if(key.equals("40") || key.equals("38") || key.equals(" ") || key.equals("b") || key.equals("a") || key.equals("\n") || key.equals("37") || key.equals("39")) keyspressed.add(key);
  String currentkeys = "";
  if (keyspressed.size() >= 11) {
    for (int i = 0; i<keyspressed.size(); i++) {
      currentkeys = currentkeys + keyspressed.get(i) + " ";
    }
    if (currentkeys.contains(targetkeys)) {
      BALL_SPEED = 16;
      PADDLE_SPEED = 11;
      System.out.println("ULTRA FAST MODE ACTIVATED");
      for (int i = 0; i < keyspressed.size(); i++) {
        keyspressed.remove(0);
      }
    }
  }
  
  

}

