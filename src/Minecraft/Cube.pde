class Cube {
  PVector pos;
  float len = cubeSize;
  int cubeType;
  color[] cubeColors = {
    color(255, 255, 255),
    color(0, 255, 0),
    color(150, 100, 50),
    color(200, 200, 200)
  };
  Cube(float x, float y, float z, int cubeType) {
    pos = new PVector(x, y, z);
    this.cubeType = cubeType;
  }
  
  void show() {
    pushMatrix();
    fill(cubeColors[cubeType]);
    translate(pos.x * len, pos.y * len, pos.z * len);
    box(len);
    popMatrix();
  }
  
  int getCubeType() {
    return this.cubeType;
  }
}
