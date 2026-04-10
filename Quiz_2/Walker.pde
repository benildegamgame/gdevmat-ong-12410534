class Walker
{
  float x;
  float y;
  
  color rand;
  
  Walker()
  {
    rand = color(0);
  }
  
  void render()
  {
    fill(random(255), random(255), random(255), random(50, 100));
    noStroke();
    circle(x, y, 30);
  }
  
  void randomWalk()
  {
    int rng = int(random(8));
    
    if (rng == 0) // down
    {
      y+=10;
    }
    else if (rng == 1) // down
    {
      y-=10;
    }
    else if (rng == 2) // left
    {
      x+=10;
    }
    else if (rng == 3) // right
    {
      x-=10;
    }
    else if (rng == 4) // down right
    {
      x += 10; 
      y += 10;
    }
    else if (rng == 5) // down left
    {
      x -= 10; 
      y += 10;
    }
    else if (rng == 6) // up right
    {
      x += 10; 
      y -= 10;
    }
    else if (rng == 7) // up left 67!!
    {
      x -= 10; 
      y -= 10;
    }
   }
    
    void randomWalkBiased()
   {
    float rng = random(1);

    if (rng < 0.4) {
      x += 10;
    }
    else if (rng < 0.6) {
      x -= 10;
    }
    else if (rng < 0.8) {
      y -= 10;
    }
    else {
      y += 10;
    }
  }
}
