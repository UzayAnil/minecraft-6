class Player {
  Player() {
    // QueasyCam stuff
    cam.speed = 2.5;
    cam.sensitivity = 0.75;
  }
  
  PVector getPos() {
    return cam.position;
  }
  
  void gravity(float force) {
    
  }
}
