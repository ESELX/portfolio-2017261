class Planet {
  float x;
  float y;
  float r;
  float s;
  void setCoords(float millis, float rOrbit, float rOrbit2) {
    this.x = sin(millis * this.s) * rOrbit/2;
    this.y = cos(millis * this.s) * rOrbit2/2;
  }
  
  void display() {
    fill(221,160,221);
    strokeWeight(2);
    stroke(175,238,238);
    ellipse(this.x, this.y, this.r, this.r);
  }
  
  boolean overLapping() {
    if (this.y < 0) {
      return true;
    } else {
      return false;
    }
  }
}
