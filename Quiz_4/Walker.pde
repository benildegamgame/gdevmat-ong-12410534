class Walker
{
  public float x;
  public float y;
  public float tx = 0, ty = 10000;
  
  float tr = 0;
  float tg = 5000;
  float tb = 10000;
  float ts = 20000;
  
  color rand;
  
  void render()
  {
    float r = map(noise(tr), 0, 1, 0, 255);
    float g = map(noise(tg), 0, 1, 0, 255);
    float b = 255;
    float sizeValue = map(noise(ts), 0, 1, 5, 150);

    fill(r, g, b);
    noStroke();
    circle(x, y, sizeValue);
  }
  
 void perlinWalk()
 {
   x = map(noise(tx), 0, 1, -640, 640);
   y = map(noise(ty), 0, 1, -360, 360);
   
   tx += 0.01f;
   ty += 0.01f;
   tr += 0.01;
   tg += 0.01;
   tb += 0.01;
   ts += 0.01;
 } 
}
