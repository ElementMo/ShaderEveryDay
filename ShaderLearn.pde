import peasy.*;
PeasyCam cam;
PShader toon;
PShader particle;

void setup()
{
  size(600, 600, P3D);


}
void draw()
{

}


void drawToonSphere()
{
  toon.set("fraction", 1.6);
  shader(toon);
  background(0);
  float dirX = (mouseX / float(width) - 0.5) * 10;
  float dirY = (mouseY / float(height) - 0.5) * 10;
  directionalLight(204, 81, 63, -dirX, -dirY, -1);

  sphere(120);
  println(dirX, dirY);
}

void drawParticle()
{
  // particle = loadShader("rotatParticles.glsl");
  // particle.set("RENDERSIZE", float(width), float(height));

  particle.set("iGlobalTime", millis()/100.0);
  shader(particle);
  rect(0, 0, width, height);
}