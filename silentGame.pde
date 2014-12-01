PImage markerImg, altMarkerImg;
PImage bucketImg, altBucketImg;
//PImage eraserImg, altEraserImg;
PImage cameraImg, altCameraImg;
PImage paletteImg, greyImg;
int l, w;
int markerX, markerY, cameraX, cameraY, paletteX, paletteY, greyX, greyY;
//paintX, paintY, bucketX, bucketY, eraserX, eraserY,
boolean draw;//paint, bucket, eraser;
color bg;
color c;
int num;

//import processing.video.*;


void setup() {
  size(1500, 700);
  num = 0;
  background(255);
  textFont(createFont("Georgia", 16));
  textAlign(CENTER, CENTER);
  
  //String[] cameras = Capture.list();
  
//  if (cameras.length == 0) {
//    println("There are no cameras available for capture.");
//    exit();
//  } else {
//    println("Available cameras:");
//    for (int i = 0; i < cameras.length; i++) {
//      println(cameras[i]);
//    }
//    
//    // The camera can be initialized directly using an 
//    // element from the array returned by list():
//    cam = new Capture(this, cameras[0]);
//    cam.start();     
//  } 
  
//  paintImg = loadImage("brush1.png");
//  altPaintImg = loadImage("brush2.png");
  bucketImg = loadImage("bucket1.png");
  altBucketImg = loadImage("bucket2.png");
//  eraserImg = loadImage("eraser1.png");
//  altEraserImg = loadImage("eraser2.png");
  markerImg = loadImage("marker1.png");
  altMarkerImg = loadImage("marker2.png");
  cameraImg = loadImage("camera1.png");
  altCameraImg = loadImage("camera2.png");
  paletteImg = loadImage("palette.png");
  greyImg = loadImage("grey.png");
  l = w = 100;
  //paintX = bucketX = eraserX = 35;
  markerX = cameraX = paletteX = greyX = 13;
//  paintY = 50;
//  bucketY = 150;
//  eraserY = 250;
  markerY = 50;
  cameraY = 200;
  paletteY = 350;
  greyY = 500;
  bg = 255;
  c = color(0);
}

void draw() {
  rect(0,0, 125, 700);
  fill(100);
  strokeWeight(10);
  if (draw && mousePressed) {
    stroke(c);
    line(mouseX, mouseY, pmouseX, pmouseY); 
  }
//  } else if (bucket && mousePressed) {
//    background(bg);
//  } else if (eraser && mousePressed) {
//    stroke(bg);
//    line(mouseX, mouseY, pmouseX, pmouseY); 
//  }
  image(cameraImg, cameraX, cameraY);
  image(markerImg, markerX, markerY);
//  if (paint || overButton(paintX, paintY, l, w)) 
//    image(altPaintImg, paintX, paintY);
//  if (!paint)
//    image(paintImg, paintX, paintY); 
//  if (bucket || overButton(bucketX, bucketY, l, w)) 
//    image(altBucketImg, bucketX, bucketY);
//  if (!bucket)
//    image(bucketImg, bucketX, bucketY);
//  if(eraser || overButton(eraserX, eraserY, l, w))
//    image(altEraserImg, eraserX, eraserY);
//  if (!eraser)
//    image(eraserImg, eraserX, eraserY);
  if(overButton(cameraX, cameraY, l, w))
    image(altCameraImg, cameraX, cameraY);
  if(overButton(markerX, markerY, l, w) || draw)
    image(altMarkerImg, markerX, markerY);
  image(paletteImg, paletteX, paletteY);
  image(greyImg, greyX, greyY);
//  if (cam.available() == true) {
//      cam.read();
//    }
//   image(cam, 125, 0);
}

void mousePressed() {
//  if (overButton(paintX, paintY, l, w)) {
//    paint = true;
//    bucket = false;
//    eraser = false;
//  }
//  if (overButton(bucketX, bucketY, l, w)) {
//    paint = false;
//    bucket = true;
//    eraser = false;
//  }
//  if (overButton(eraserX, eraserY, l, w)) {
//    paint = false;
//    bucket = false;
//    eraser = true;
//  } 
  if (overButton(markerX, markerY, l, w))
    draw = !draw;
  if (overButton(paletteX, paletteY, 100, 100))
    c = get(mouseX, mouseY);
  if (overButton(greyX, greyY, 100, 100))
    c = get(mouseX, mouseY);
  if (overButton(cameraX, cameraY, 100, 100)) {
    save("pic" + num + ".png");
    num++;
//    if (cam.available() == true) {
//      cam.read();
//    }
//    this.copy(this, 0, 0, this.width, this.height, 125, 0, 1300, 700);
  }
  //image(cam, 125, 0);
  
}

boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
