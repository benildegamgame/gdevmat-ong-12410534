Walker[] walker = new Walker[10];
void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    walker[i].position = new PVector(random(-width/2, width/2),
                                     random(-height/2, height/2));

    walker[i].mass = random(2, 10);

    walker[i].scale = walker[i].mass * 10;

    walker[i].r = random(255);
    walker[i].g = random(255);
    walker[i].b = random(255);
  }
}

void draw()
{
  background(255);
  
  for (int i = 0; i < walker.length; i++)
  {
    for (int j = 0; j < walker.length; j++)
    {
      if (i != j)
      {
        PVector force = walker[j].calculateAttraction(walker[i]);
        walker[i].applyForce(force);
      }
    }
  }
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i].update();
    walker[i].render();
  }
}
