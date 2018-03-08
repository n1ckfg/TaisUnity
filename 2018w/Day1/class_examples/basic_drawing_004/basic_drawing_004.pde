int numStrokes = 1000;
Stroke[] strokes = new Stroke[numStrokes];

void setup() {
  size(640, 480);
  for (int i=0; i<numStrokes; i++) {
    strokes[i] = new Stroke();
  }
}

void draw() {
  background(0);
  
  for (int i=0; i<numStrokes; i++) {
    strokes[i].run();
  }
}