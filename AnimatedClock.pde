int width = 1000;
int height = 1000;

Watch watch = new Watch(width, height);

void setup(){
  size(width, height);
  background(0.9*255);
  noStroke();
  ellipseMode(RADIUS);
  frameRate(1);
}

void draw(){
  watch.drawClock();
}
