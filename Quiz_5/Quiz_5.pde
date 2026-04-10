void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  background(255);
}

Walker myWalker = new Walker();

void draw()
{
  background(255);
  
  myWalker.moveAndBounce();
  myWalker.render();
}
