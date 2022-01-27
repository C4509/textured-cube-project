import java.awt.Robot;

Robot rbt;
boolean skipFrame;
color black = #000000;
color white = #FFFFFF;
color dullblue = #7092BE;

int gridSize;
PImage map, blu, turq, obs, tan, wood;
boolean wkey, akey, skey, dkey;
float eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ;
float leftRightHeadAngle, upDownHeadAngle;

void setup() {
  size(displayWidth, displayHeight, P3D);
  textureMode(NORMAL);
  wkey=skey=dkey=akey=false; 
  eyeX = width/2;
  eyeY = height-200;
  eyeZ = 0;
  focusX=width/2;
  focusY = height/2;
  focusZ = 10;
  upX = 0;
  upY = 1;
  upZ = 0;
  leftRightHeadAngle= radians(270);
  map = loadImage("map.png");
  blu = loadImage("blu.png");
  obs = loadImage("obs.png");
  turq = loadImage("turq.png");
  tan = loadImage("tan.jpg");
  wood = loadImage("wood.jpg");
  gridSize = 100;

  try {
    rbt = new Robot();
  } 
  catch(Exception e) {
    e.printStackTrace();
  }
  skipFrame = false;
}
void draw() {
  background(0);
  //pointLight(0,0,255,eyeX, eyeY, eyeZ);
  camera(eyeX, eyeY, eyeZ, focusX, focusY, focusZ, upX, upY, upZ);
    drawFloor(-2000, 2000, height, gridSize);
  drawFloor(-2000, 2000, height -gridSize*4, gridSize);

  drawFocalPoint();
  controlCamera();
  drawMap();
}
void  drawMap() {
  for (int x = 0; x < map.width; x++) {
    for ( int y = 0; y < map.height; y++) {
      color c = map.get(x, y); 
      if (c==dullblue) {
        textCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, turq, gridSize);
        textCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, turq, gridSize);        
        textCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, turq, gridSize);
        //pushMatrix();
        //fill(c);
        //stroke(100);
        //translate(x*gridSize-2000, height/2, y*gridSize-2000);
        //box(gridSize,height, gridSize);
        //popMatrix();
      }
      if (c == black){
        textCube(x*gridSize-2000, height-gridSize, y*gridSize-2000, tan, gridSize);
        textCube(x*gridSize-2000, height-gridSize*2, y*gridSize-2000, tan, gridSize);        
        textCube(x*gridSize-2000, height-gridSize*3, y*gridSize-2000, tan, gridSize);
      }
    }
  }
}
void drawFloor(int x1, int x2, int h, int w) {
  stroke(255);
  int x = x1;
  int z = x1;
  while(z < x2) {
  textCube(x, h, z, blu,w);
  x = x + w;
  if( x >= x2){
    x = x1;
    z = z + w;
  }
  }
  //for (int x =x1; x <=x2; x = x + w) {
  //  line(x, h, x2, x, height, x2);
  //  line(-x1, h, x, x2, height, x);
  //}
}

void drawFocalPoint() {
  pushMatrix();
  translate(focusX, focusY, focusZ);
  sphere(10);
  popMatrix();
}

void controlCamera() {

  if (wkey) {
    eyeZ = eyeZ + sin(leftRightHeadAngle)*10;
    eyeX = eyeX + cos(leftRightHeadAngle)*10;
  }

  if (akey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle)*10;
    eyeX = eyeX - cos(leftRightHeadAngle)*10;
  }

  if (skey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle)+PI/2*10;
    eyeX = eyeX - cos(leftRightHeadAngle+PI/2)*10;
  }

  if (dkey) {
    eyeZ = eyeZ - sin(leftRightHeadAngle)-PI/2*10;
    eyeX = eyeX - cos(leftRightHeadAngle-PI/2)*10;
  }
if(skipFrame == false){
  leftRightHeadAngle = leftRightHeadAngle + (mouseX-pmouseX)*0.01;
  upDownHeadAngle = upDownHeadAngle + (mouseY-pmouseY)*0.01;

}
  if (upDownHeadAngle > PI/2.5) {
    upDownHeadAngle = PI/2.5;
  }
  if (upDownHeadAngle < -PI/2.5) {
    upDownHeadAngle = -PI/2.5;
  }

  focusX = eyeX+cos(leftRightHeadAngle)*300;
  focusY = eyeY+ tan(upDownHeadAngle)*300;
  focusZ = eyeZ+sin(leftRightHeadAngle)*300;

  if (mouseX < 2) { 
    rbt.mouseMove(width-3, mouseY);
    skipFrame = true;
  } else if (mouseX > width-2){rbt.mouseMove(width-3, mouseY);
  skipFrame = true;
  } else {
    skipFrame = false;
  }
}
