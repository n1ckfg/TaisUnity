PImage img;

void setup() {
  size(640, 480);
  img = loadImage("amber_bear.jpg");
  imageMode(CENTER);
  background(0);
}

void draw() {
  if (mousePressed) {
    pushMatrix();
    translate(mouseX, mouseY);
    rotate(random(360));    
    image(img, 0, 0, img.width/4, img.height/4);
    popMatrix();
  }
  
  ellipse(width/2, height/2, 20, 20);
}