float[] x = new float[20];
float[] y = new float[20];
float segLength = 3;

PImage maze;

void setup() {
  size(499, 491);
  strokeWeight(9);
  stroke(255, 204,0);
  maze = loadImage("maze.jpg");
}

void draw() {
  background(51);
  image (maze, 0, 0);
  dragSegment(0, mouseX, mouseY);
  for(int i=0; i<x.length-1; i++) {
    dragSegment(i+1, x[i], y[i]);
  }
}

void dragSegment(int i, float xin, float yin) {
  float dx = xin - x[i];
  float dy = yin - y[i];
  float angle = atan2(dy, dx);  
  x[i] = xin - cos(angle) * segLength;
  y[i] = yin - sin(angle) * segLength;
  segment(x[i], y[i], angle);
}

void segment(float x, float y, float a) {
  pushMatrix();
  translate(x, y);
  rotate(a);
  line(0, 0, segLength, 0);
  popMatrix();

}
