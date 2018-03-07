// https://processing.org/reference/camera_.html
class Cam {

  PVector pos = new PVector(0,0,0);
  PVector poi = new PVector(0,0,0);
  PVector up = new PVector(0,0,0);

  PVector mouse = new PVector(0,0,0);
  PMatrix3D proj, cam, modvw, modvwInv, screen2Model;
  
  void initMatrix() {
    proj = new PMatrix3D();
    cam = new PMatrix3D();
    modvw = new PMatrix3D();
    modvwInv = new PMatrix3D();
    screen2Model = new PMatrix3D();
  }
  
  void updateMatrix() {
    //proj = tex.projection.get();
    cam = tex.camera.get();
    //modvw = tex.modelview.get();
    modvwInv = tex.modelviewInv.get();
    screen2Model = modvwInv;
    screen2Model.apply(cam);
    float screen[] = {mouseX, mouseY, poi.z};
    float model[] = new float[3];
    screen2Model.mult(screen, model);
    
    mouse = new PVector(model[0] + (poi.x - width/2), model[1] + (poi.y - height/2), model[2]);
  }
  
  Cam() {
    defaultPos();
    defaultPoi();
    defaultUp();
    initMatrix();
  }
  
  Cam(PVector _pos) {
    pos = _pos;
    defaultPoi();
    defaultUp();
    initMatrix();
  }
  
  Cam(PVector _pos, PVector _poi) {
    pos = _pos;
    poi = _poi;
    defaultUp();
    initMatrix();
  }
  
  Cam(PVector _pos, PVector _poi, PVector _up) {
    pos = _pos;
    poi = _poi;
    up = _up;
    initMatrix();
  }
  
  void update() {
    updateControls();
    updateMatrix();
  }
  
  void draw() {
    tex.camera(pos.x, pos.y, pos.z, poi.x, poi.y, poi.z, up.x, up.y, up.z);
  }
  
  void run() {
    update();
    draw();
  }
  
  void move(float x, float y, float z) {
    PVector p = new PVector(x,y,z);
    pos = pos.add(p);
    poi = poi.add(p);
  }
  
  void defaultPos() {
    pos.x = width/2.0;
    pos.y = height/2.0;
    pos.z = (height/2.0) / tan(PI*30.0 / 180.0);
  }
  
  void defaultPoi() {
    poi.x = width/2.0;
    poi.y = height/2.0;
    poi.z = 0;
  }
  
  void defaultUp() {
    up.x = 0;
    up.y = 1;
    up.z = 0;
  }
  
  void reset() {
    defaultPos();
    defaultPoi();
    defaultUp();
  }
  
}

// TODO
// https://processing.org/reference/frustum_.html
// https://processing.org/reference/beginCamera_.html
// https://processing.org/reference/endCamera_.html