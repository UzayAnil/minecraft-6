import picking.*;
import queasycam.*;

Picker picker;
QueasyCam cam;
World world;

Player player;
float cubeSize = 40;
int dim = 100;

Cube[][][] cubes = new Cube[dim][dim][dim];
int[][][] cubeVals = new int[dim][dim][dim];

void setup() {
  //fullScreen(P3D);
  size(1280, 720, P3D);
  init();
  player = new Player();
  world = new World(0.05);
  picker = new Picker(this);
  
  println(cam.getForward());
}

void init() {
  cam = new QueasyCam(this);
}

void draw() {
  background(240);
  
  world.show();
  frustum(-15, 10, -10, 10, 10, world.view * cubeSize);
  
  /*hint(DISABLE_DEPTH_TEST);
  text("" + player.getPos().x / cubeSize + " " + player.getPos().y / cubeSize + " " + player.getPos().z / cubeSize, 400, 400, 10);*/
  
  if (mousePressed) {
    PVector targ = cam.getForward();
    
    
    println(targ);
    pushMatrix();
    /*rotateX(player.getPos().x);
    rotateY(player.getPos().y);
    rotateZ(player.getPos().z);*/
    //translate(player.getPos().x, player.getPos().y, player.getPos().z);
    line(player.getPos().x, player.getPos().y, player.getPos().z, 0, 0, 0);
    popMatrix();
    
    
  }
}

void mouseClicked() {
  /*int id = picker.get(width / 2, height / 2);
  if (id > -1) {
    //cubes[id][id][id] = null;
    //cubeVals[id][id][id] = 0;
    println(id);
  }*/
  
  
  
  
  
}

void clickBlock() {
  
}
