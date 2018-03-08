float x = width/2;
float y = height/2;
String s = "hello";
boolean b = true;  
  
void setup() {
  size(640, 480);
  frameRate(60);
  background(0);
}

void draw() {  
  if (mousePressed) {
    strokeWeight(20);
    if (b) {
      stroke(0, 255, 0);
    } else {
      stroke(0, 0, 255);
    }
    beginShape();
    vertex(0, 0);
    vertex(pmouseX, pmouseY);
    vertex(mouseX, mouseY);
    endShape();
    
    stroke(0, 255, 0);
    point(mouseX, mouseY);
  }
}

void keyPressed() {
  b = !b;
  println(b);
}