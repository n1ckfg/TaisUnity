class Stroke {
  
  PVector p;
  PVector target;
  float speedDelta = 0.01;
  float speedMax = 10;
  float speedMin = 1;
  float speed = speedMin;
  
  Stroke() {
    p = new PVector(random(width), random(height));
    target = new PVector(random(width), random(height));
  }
  
  void update() {
    if (mousePressed) {
      if (dist(p.x, p.y, mouseX, mouseY) > 10) {
        if (speed < speedMax) speed += speedDelta;
      } else {
        if (speed > speedMin) speed -= speedDelta;
      }
      speed = constrain(speed, speedMin, speedMax);
      p.x = lerp(p.x, mouseX, speed/20.0);
      p.y = lerp(p.y, mouseY, speed/20.0);
    } else {
      target = new PVector(random(width), random(height));
      p.x = lerp(p.x, target.x, speed/20.0);
      p.y = lerp(p.y, target.y, speed/20.0);
    }
  }
  
  void draw() {
    fill(0, 255, 0);
    ellipse(p.x, p.y, 10, 10);
    fill(0, 0, 255);
    ellipse(p.x, p.y, 2, 2);
  }
  
  void run() {
    update();
    draw();
  }
  
}