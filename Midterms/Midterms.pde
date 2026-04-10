ArrayList<Matter> matterList = new ArrayList<Matter>();
ArrayList<BlackHole> blackHoles = new ArrayList<BlackHole>();

int frameReset = 100;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  resetSimulation();
}

void draw()
{
  background(0);

  for (BlackHole bh : blackHoles)
  {
    bh.followMouse(); // BONUS
    bh.render();
  }

  for (int i = matterList.size() - 1; i >= 0; i--)
  {
    Matter m = matterList.get(i);

    m.update(blackHoles);
    m.render();

    if (m.isDead)
    {
      matterList.remove(i);
    }
  }

  if (frameCount % frameReset == 0)
  {
    resetSimulation();
  }
}

void resetSimulation()
{
  matterList.clear();
  blackHoles.clear();

  int bhCount = 3;

  for (int i = 0; i < bhCount; i++)
  {
    blackHoles.add(new BlackHole(
      random(-width/2, width/2),
      random(-height/2, height/2)
    ));
  }

  for (int i = 0; i < 120; i++)
  {
    float x = randomGaussian() * width/6;
    float y = randomGaussian() * height/6;

    matterList.add(new Matter(x, y));
  }
}
