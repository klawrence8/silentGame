import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import processing.video.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class silentGame extends PApplet {

PImage paintImg, altPaintImg;
PImage bucketImg, altBucketImg;
PImage eraserImg, altEraserImg;
PImage cameraImg, altCameraImg;
PImage paletteImg;
PImage pic;
int l, w;
int paintX, paintY, bucketX, bucketY, eraserX, eraserY, cameraX, cameraY, paletteX, paletteY;
boolean paint, bucket, eraser;
int bg;
int c;



Capture cam;

public void setup() {
  size(1500, 700);
  
  background(255);
  textFont(createFont("Georgia", 16));
  textAlign(CENTER, CENTER);
  
  String[] cameras = Capture.list();
  
  if (cameras.length == 0) {
    println("There are no cameras available for capture.");
    exit();
  } else {
    println("Available cameras:");
    for (int i = 0; i < cameras.length; i++) {
      println(cameras[i]);
    }
    
    // The camera can be initialized directly using an 
    // element from the array returned by list():
    cam = new Capture(this, cameras[0]);
    cam.start();     
  } 
  
  paintImg = loadImage("brush1.png");
  altPaintImg = loadImage("brush2.png");
  bucketImg = loadImage("bucket1.png");
  altBucketImg = loadImage("bucket2.png");
  eraserImg = loadImage("eraser1.png");
  altEraserImg = loadImage("eraser2.png");
  cameraImg = loadImage("camera1.png");
  altCameraImg = loadImage("camera2.png");
  paletteImg = loadImage("palette.png");
  l = w = 75;
  paintX = bucketX = eraserX = 35;
  cameraX = 13;
  paletteX = 13; 
  paintY = 50;
  bucketY = 150;
  eraserY = 250;
  cameraY = 350;
  paletteY = 500;
  bg = 255;
  c = color(0);
}

public void draw() {
  rect(0,0, 125, 700);
  fill(100);
  strokeWeight(10);
  if (paint && mousePressed) {
    stroke(c);
    line(mouseX, mouseY, pmouseX, pmouseY); 
  } else if (bucket && mousePressed) {
    background(bg);
  } else if (eraser && mousePressed) {
    stroke(bg);
    line(mouseX, mouseY, pmouseX, pmouseY); 
  }
  image(cameraImg, cameraX, cameraY);
  if (paint || overButton(paintX, paintY, l, w)) 
    image(altPaintImg, paintX, paintY);
  if (!paint)
    image(paintImg, paintX, paintY); 
  if (bucket || overButton(bucketX, bucketY, l, w)) 
    image(altBucketImg, bucketX, bucketY);
  if (!bucket)
    image(bucketImg, bucketX, bucketY);
  if(eraser || overButton(eraserX, eraserY, l, w))
    image(altEraserImg, eraserX, eraserY);
  if (!eraser)
    image(eraserImg, eraserX, eraserY);
  if(overButton(cameraX, cameraY, l, w))
    image(altCameraImg, cameraX, cameraY);
  if (!eraser)
    image(eraserImg, eraserX, eraserY);
  image(paletteImg, paletteX, paletteY);
}

public void mousePressed() {
  if (overButton(paintX, paintY, l, w)) {
    paint = true;
    bucket = false;
    eraser = false;
  }
  if (overButton(bucketX, bucketY, l, w)) {
    paint = false;
    bucket = true;
    eraser = false;
  }
  if (overButton(eraserX, eraserY, l, w)) {
    paint = false;
    bucket = false;
    eraser = true;
  } 
  if (overButton(paletteX, paletteY, 100, 100)) {
    c = get(mouseX, mouseY);
  }
  if (overButton(cameraX, cameraY, 100, 100)) {
    if (cam.available() == true) {
      cam.read();
    }
    this.copy(cam, 0, 0, cam.width, cam.height, 125, 0, 1300, 700);
  }
}

public boolean overButton(int x, int y, int width, int height)  {
  if (mouseX >= x && mouseX <= x+width && 
      mouseY >= y && mouseY <= y+height) {
    return true;
  } else {
    return false;
  }
}
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "--full-screen", "--bgcolor=#666666", "--stop-color=#cccccc", "silentGame" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
