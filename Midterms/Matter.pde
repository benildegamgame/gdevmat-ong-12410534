class Matter
{
  PVector pos;
  PVector vel;
  float size;
  color c;
  boolean isDead = false;

  Matter(float x, float y)
  {
    pos = new PVector(x, y);
    vel = new PVector(0, 0);

    size = random(3, 12);
    c = color(random(255), random(255), random(255));
  }

  void update(ArrayList<BlackHole> holes)
  {
    BlackHole closest = holes.get(0);
    float closestDist = PVector.dist(pos, closest.pos);

    for (BlackHole bh : holes)
    {
      float d = PVector.dist(pos, bh.pos);
      if (d < closestDist)
      {
        closest = bh;
        closestDist = d;
      }
    }

    PVector dir = PVector.sub(closest.pos, pos);
    dir.normalize();
    dir.mult(2);

    vel.add(dir);
    vel.mult(0.95);
    pos.add(vel);

    if (closestDist < 25)
    {
      isDead = true;
    }
  }

  void render()
  {
    noStroke();
    fill(c);
    circle(pos.x, pos.y, size);
  }
}
