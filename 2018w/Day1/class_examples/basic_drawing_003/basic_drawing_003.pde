int numCircles = 500;
float[] x = new float[numCircles];
float[] y = new float[numCircles];
float[] speedX = new float[numCircles];
float[] speedY = new float[numCircles];
float[] circleSize = new float[numCircles];

void setup() {
  size(640, 480, P2D);
  for (int i=0; i<numCircles; i++) {
    x[i] = random(width);
    y[i] = random(height);
    speedX[i] = random(0, 10);
    speedY[i] = random(0, 10);
    circleSize[i] =random(5, 50);
  }
  background(0);
}

void draw() {
  fill(0, 40);
  rect(0, 0, width, height);

  fill(255, 127);
  for (int i=0; i<numCircles; i++) {
    ellipse(x[i], y[i], circleSize[i], circleSize[i]);
    x[i] += speedX[i];
    y[i] += speedY[i];
    if (x[i] > width || x[i] < 0) {
      speedX[i] *= -1;
    }
    if (y[i] > height || y[i] < 0) {
      speedY[i] *= -1;
    }    
  }
}  