import SimpleOpenNI.*;

boolean multiThread = false;
boolean mirror = true;
SimpleOpenNI context;

void setupSoni() {  
  if (multiThread) {
    context = new SimpleOpenNI(this,SimpleOpenNI.RUN_MODE_MULTI_THREADED);
  }else{
    context = new SimpleOpenNI(this);
  }
  //context = new SimpleOpenNI(this);
  context.setMirror(mirror);  //mirrors view but not joint names; that must be done separately
   
  // enable depthMap generation 
  context.enableDepth();
  
  // enable rgb
  //context.enableRGB();
  
  // enable skeleton generation for all joints
  //context.enableUser(SimpleOpenNI.SKEL_PROFILE_ALL);
  //context.enableUser();  
}

void drawSoni() {
  // update the cam
  context.update();
  image(context.depthImage(),0,0);
}

String zeroPadding(int _val, int _maxVal){
  String q = ""+_maxVal;
  return nf(_val,q.length());
}