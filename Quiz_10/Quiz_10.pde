Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);
Walker[] walker = new Walker[10];

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  for (int i = 0; i < walker.length; i++)
  {
    walker[i] = new Walker();

    float spacing = width / (float)(walker.length + 1);
    float posX = spacing * (i + 1) - width/2;

    walker[i].position = new PVector(posX, height/2 + 50);

    walker[i].mass = random(1, 10);
    walker[i].scale = walker[i].mass * 10;

    walker[i].r = random(255);
    walker[i].g = random(255);
    walker[i].b = random(255);
  }
}

void draw()
{
  background(255);
  
  ocean.render();
  for (Walker w : walker)
  {
    w.render();
    w.update();

    PVector wind = new PVector(0.1, 0);
    w.applyForce(wind);

    PVector gravity = new PVector(0, -0.15f * w.mass);
    w.applyForce(gravity);

    if (ocean.isCollidingWith(w))
    {
      PVector dragForce = ocean.calculateDragForce(w);
      w.applyForce(dragForce);
    }

    if (w.position.y <= Window.bottom)
    {
      w.position.y = Window.bottom;
      w.velocity.y *= -1;
    }
  }
}
