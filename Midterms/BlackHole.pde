class BlackHole
{
  PVector pos;

  BlackHole(float x, float y)
  {
    pos = new PVector(x, y);
  }

  void followMouse()
  {
    pos.x = mouseX - width/2;
    pos.y = mouseY - height/2;
  }

  void render()
  {
    noStroke();
    fill(255);
    circle(pos.x, pos.y, 50);
  }
}
