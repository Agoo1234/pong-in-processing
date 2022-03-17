// In this tab, DO NOT CHANGE ANY CODE
// 
// YOU MAY ADD NEW METHODS, BUT DO NOT CHANGE ANY EXISTING CODE IN THIS TAB

public double square(double x) {
  return x*x;
}

public boolean between(double a, double b, double c) {
  return (a >= b) && (a <= c);
}

public PVector initializeBallVector() {
  return new PVector(-Math.abs(4+random(0,2)),random(-2,2));
}
