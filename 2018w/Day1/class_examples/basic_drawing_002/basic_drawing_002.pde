int counter = 0;

void setup() {
  size(640, 480, P2D);
  frameRate(60);
  fill(255, 127, 10, 40);
  blendMode(ADD);
  background(0);
}

void draw() {
  if (counter > 1000) {
    background(0);
    counter = 0;
  }
  
  for (int i=0; i<10; i++) {
    ellipse(random(width), random(height), 10, 10);
    counter++;
  }
  
  println(counter);
}