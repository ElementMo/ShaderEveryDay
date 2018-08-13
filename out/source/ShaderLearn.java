import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import peasy.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class ShaderLearn extends PApplet {


PeasyCam cam;
PShader toon;
PShader particle;

public void setup()
{
  

  particle = loadShader("rotatParticles.glsl");
  particle.set("RENDERSIZE", PApplet.parseFloat(width), PApplet.parseFloat(height));
}
public void draw()
{
  particle.set("iGlobalTime", millis()/100.0f);


  shader(particle);
  rect(0, 0, width, height);
}


public void drawToonSphere()
{
  toon.set("fraction", 1.6f);
  shader(toon);
  background(0);
  float dirX = (mouseX / PApplet.parseFloat(width) - 0.5f) * 10;
  float dirY = (mouseY / PApplet.parseFloat(height) - 0.5f) * 10;
  directionalLight(204, 81, 63, -dirX, -dirY, -1);

  sphere(120);
  println(dirX, dirY);
}
  public void settings() {  size(600, 600, P3D); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "ShaderLearn" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
