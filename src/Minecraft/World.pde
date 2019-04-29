class World {
  float threshold;
  int view;
  World(float threshold) {
    generateWorld(threshold);
    this.view = 15;
  }
  
  void generateWorld(float threshold) {
    float[][] temp = new float[dim][dim];
    float yoff = 0;
    for (int y = 0 ; y < dim ; y++) {
      float xoff = 0;
      for (int x = 0 ; x < dim ; x++) {
        temp[x][y] = map(noise(xoff, yoff), 0, 1, 0, 40);
        xoff += threshold;
      }
      yoff += threshold;
    }
    
    for (int i = 0 ; i < dim ; i++) {
      for (int j = 0 ; j < dim ; j++) {
        cubes[i][round(temp[i][j])][j] = new Cube(i, round(temp[i][j]), j, 1);
        cubeVals[i][round(temp[i][j])][j] = 1;
        
        for (int p = round(temp[i][j]) + 1 ; p < dim ; p++) {
          if (p - round(temp[i][j]) > 3) {
            cubes[i][p][j] = new Cube(i, p, j, 3); 
            cubeVals[i][p][j] = 3;
          } else {
            cubes[i][p][j] = new Cube(i, p, j, 2);
            cubeVals[i][p][j] = 2;
          }
        }
      }
    }
  }
  
  void show() {
    for (int i = 1 ; i < dim; i++) {
      for (int j = 1 ; j < dim; j++) {
        for (int k = 1 ; k < dim; k++) {
          if (i > player.getPos().x / cubeSize - this.view && i < player.getPos().x / cubeSize + this.view && k > player.getPos().z / cubeSize - this.view && k < player.getPos().z / cubeSize + this.view) {
            if (i < dim - 1 && j < dim - 1 && k < dim - 1) {
              if (cubeVals[i][j][k] != 0) {
                if (cubeVals[i][j - 1][k] == 0 || cubeVals[i - 1][j][k] == 0 || cubeVals[i + 1][j][k] == 0 || cubeVals[i][j][k - 1] == 0 || cubeVals[i][j][k + 1] == 0 || cubeVals[i][j + 1][k] == 0) {
                  //picker.start(i);
                  cubes[i][j][k].show();
                }
              }
            }
          }
        }
      }
    }
  }
}
