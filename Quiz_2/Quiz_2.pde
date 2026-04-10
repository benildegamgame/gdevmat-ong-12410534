Walker myWalker = new Walker();
Walker xWalker = new Walker();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  xWalker.x = 100; 
}

void draw()
{
  
  myWalker.randomWalk();
  myWalker.render();
  
  xWalker.randomWalkBiased();
  xWalker.render();
}
