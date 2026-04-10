Walker[] walker = new Walker[8];

PVector force = new PVector(0.2, 0);

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0); //idk why the camera keeps bugging when its in fullscreen T-T
  
  initializeWalkers();
}

void draw()
{
  background(255);
  
  stroke(0);
  strokeWeight(3);
  line(0, -height/2, 0, height/2);
  
  for (int i = 0; i < walker.length; i++)
  {
    Walker w = walker[i];

    PVector acc = force.copy().mult(w.mass);
    w.applyForce(acc);

    float mew = 0.01f;

    if (w.position.x > 0)
    {
      mew = 0.4f;
    }

    float normal = 1;
    float frictionMagnitude = mew * normal;
    PVector friction = w.velocity.copy();
    friction.mult(-1);
    
    if (friction.mag() > 0)
    {
      friction.normalize();
      friction.mult(frictionMagnitude);
      w.applyForce(friction);
    }
    
    PVector gravity = new PVector(0, -0.15 * w.mass);

    w.update();
    w.checkEdges();
    w.render();
  }
}

void initializeWalkers()
{
  int n = walker.length;

  for (int i = 0; i < n; i++)
  {
    walker[i] = new Walker();

    float posY = 2 * (height / (float)n) * (i - (n / 2.0));
    walker[i].position = new PVector(-width/2, posY);

    walker[i].mass = i + 1;

    walker[i].scale = walker[i].mass * 15;

    walker[i].c = color(random(255), random(255), random(255));
  }
}

void mousePressed()
{
  initializeWalkers();
}
