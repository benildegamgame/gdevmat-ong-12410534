ArrayList<Walker> walkers = new ArrayList<Walker>();

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < 100; i++)
  {
    Walker myWalker = new Walker();

    myWalker.position = new PVector(random(-width/2, width/2), random(-height/2, height/2));

    myWalker.scale = random(5, 30);

    walkers.add(myWalker);
  }
}

void draw()
{
  background(80);
  PVector mouse = new PVector(mouseX - width/2,
                             -(mouseY - height/2));

  for (Walker myWalker : walkers)
  {
    PVector dir = PVector.sub(mouse, myWalker.position);

    dir.normalize();

    dir.mult(0.2);

    myWalker.acceleration = dir;

    myWalker.update();
    myWalker.render();
  }
}
