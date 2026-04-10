Walker[] walker = new Walker[10];

PVector wind = new PVector(0.15, 0);
PVector gravity = new PVector(0, -0.4);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    walker[i].position = new PVector(-500, 200);

    walker[i].mass = random(1, 10);
    walker[i].scale = walker[i].mass * 15;

    walker[i].c = color(random(255), random(255), random(255));
  }
}

void draw()
{
  background(80);
  
  for (Walker w : walker)
  {
    w.applyForce(wind);
    w.applyForce(gravity);

    w.update();
    w.checkEdges();
    w.render();
  }
}
