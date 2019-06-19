
ArrayList<Planet> planets = new ArrayList<Planet>();
ArrayList<Planet> planetsB = new ArrayList<Planet>();
ArrayList<Planet> planetsT = new ArrayList<Planet>();

void setup() {
  size(1300, 500);
  Planet planet1 = new Planet();
  planet1.s = 0.001;
  planet1.r = 12;
  planets.add(planet1);
}

float traceOrbit = 800;
float traceOrbit2 = 150;
float rSun = 300;
int i;

void draw() {
  translate(width/2, height/2);
  rotate(radians(-25));
  background(100,149,237);
  planetsB = new ArrayList<Planet>();
  planetsT = new ArrayList<Planet>();
  for (Planet planet : planets) {
    planet.setCoords(millis(), traceOrbit, traceOrbit2);
    if (planet.overLapping()) {
      planetsB.add(planet);
    } else {
      planetsT.add(planet);
    }
  }
  printHalfSun(false);
  printTrace();
  for (Planet planet : planetsT) {
    planet.display();
  }
  for (Planet planet : planetsB) {
    planet.display();
  }
  printHalfSun(true);
  makeNoise();
}


void printHalfSun(boolean top) {
  strokeWeight(5);
  if (top) {
    fill(255,127,80);
    stroke(255,160,122);
    arc(0, 0, rSun, rSun, PI, TWO_PI);
  } else {
    fill(255,127,80);
    stroke(255,160,122);
    arc(0, -0.3, rSun, rSun, 0, PI);
  }
}

void printTrace() {
  noFill();
  stroke(100,149,237);
  strokeWeight(0);
  ellipse(0, 0, 0, 0); 

  noFill();
  stroke(100,149,237);
  strokeWeight(4);
  ellipse(0, 0, 0, 0);
}

void mousePressed() {
  Planet planet1 = new Planet();
  planet1.s = random(0.0001, 0.002);
  planet1.r = random(20, 50);
  planets.add(planet1);
}

void keyPressed(){
  planets = new ArrayList<Planet>();
}

void makeNoise() {
  rotate(radians(5000));
  noStroke();
  strokeWeight(0);
  for (int i = -width/2; i < width/2 - 1; i += 5) {
    for (int j = -height/2; j < height/2 - 1; j += 5) {
      fill(random(0), random(0));
      rect(random(i - 5, i), random(j - 5, j), random(1, 2), random(1 ,2));
    }
  }
  for (int i = 0; i < 15; i++) {
    fill(random(0));
    rect(random(-width, width/2), random(-height, height/2), 2, 2);
  }
}
