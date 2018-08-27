
PShader blur, contrast;
PImage img;
PGraphics src, pass1, pass2, layer2, blend;

int view_w = 600;
int view_h = 600;

void setup()
{
  size(1200, 600, P2D);

  img = loadImage("img2.png");
  src = createGraphics(view_w, view_h, P2D);
  pass1 = createGraphics(view_w, view_h, P2D);
  pass2 = createGraphics(view_w, view_h, P2D);
  blend = createGraphics(view_w, view_h, P2D);
  layer2 = createGraphics(view_w, view_h, P2D);

  contrast = loadShader("contrast.glsl");
  contrast.set("contrast", 1.9);

  blur = loadShader("blur.glsl");
  blur.set("texOffset", 0.0, 0.0);
  blur.set("blurSize", 100);
  blur.set("horizontalPass", 0);
  blur.set("sigma", 200.0);
}
void draw()
{
  //垂直方向的高斯模糊
  pass1.beginDraw();
  blur.set("horizontalPass", 0);
  pass1.shader(blur);
  pass1.image(img, 0, 0, view_w, view_h);
  pass1.endDraw();

  //水平方向的高斯模糊（与上一层叠加）
  pass2.beginDraw();
  blur.set("horizontalPass", 1);
  pass2.shader(blur);
  pass2.image(pass1, 0, 0);
  pass2.endDraw();

  //增强模糊后的画面对比度
  layer2.beginDraw();
  layer2.shader(contrast);
  layer2.image(pass2, 0, 0);
  layer2.endDraw();

  //以Screen模式叠加原图与Bloom图层
  blend.beginDraw();
  blend.blendMode(SCREEN);
  blend.background(0);
  blend.image(img, 0, 0, view_w, view_h);
  blend.shader(contrast);
  blend.image(layer2, 0, 0);
  blend.endDraw();

  image(img, 0, 0, view_w, view_h);
  image(blend, view_w, 0, view_w, view_h);
}
