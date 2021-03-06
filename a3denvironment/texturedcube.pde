void textCube(float x, float y, float z, PImage texture, float size){
  
  
   pushMatrix();
  translate(x,y,z);
  scale(size);
  //rotateX(rotx);
  //rotateY(roty);
  noStroke();
  beginShape(QUADS);
  texture(texture);

  //top
  //x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  //bottom
 vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  //front
 vertex(0,0,0,0,0);
 vertex(0,1,0,0,1);
 vertex(0,1,1,1,1);
 vertex(0,0,1,1,0);
  //back
  vertex(1,0,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(1,0,1,0,1);

  //left
 vertex(0,0,0,0,0);
 vertex(1,0,0,1,0);
 vertex(1,1,0,1,1);
 vertex(0,1,0,0,1);
  //right
    vertex(0,0,1,0,0);
    vertex(1,0,1,0,1);
    vertex(1,1,1,1,1);
    vertex(0,1,1,1,0);
  endShape();
  popMatrix();
  
  
  
}
void textCube(float x, float y, float z, PImage top,PImage side, PImage bottom, float size){
  
  
   pushMatrix();
  translate(x,y,z);
  scale(size);
  //rotateX(rotx);
  //rotateY(roty);
  noStroke();
  beginShape(QUADS);
  texture(top);

  //top
  //x,y,z,tx,ty
  vertex(0,0,0,0,0);
  vertex(1,0,0,1,0);
  vertex(1,0,1,1,1);
  vertex(0,0,1,0,1);
  endShape();
  //bottom
  beginShape(QUADS);
  texture(bottom);
 vertex(0,1,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(0,1,1,0,1);
  endShape();
  //front
    beginShape(QUADS);
  texture(side);
 vertex(0,0,0,0,0);
 vertex(0,1,0,0,1);
 vertex(0,1,1,1,1);
 vertex(0,0,1,1,0);
  //back
  vertex(1,0,0,0,0);
  vertex(1,1,0,1,0);
  vertex(1,1,1,1,1);
  vertex(1,0,1,0,1);

  //left
 vertex(0,0,0,0,0);
 vertex(1,0,0,1,0);
 vertex(1,1,0,1,1);
 vertex(0,1,0,0,1);
  //right
    vertex(0,0,1,0,0);
    vertex(1,0,1,0,1);
    vertex(1,1,1,1,1);
    vertex(0,1,1,1,0);
  endShape();
  popMatrix();
  
  
  
}
