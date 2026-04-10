class Walker
{
  public PVector position = new PVector();
  PVector velocity;
  
  Walker()
  {
    velocity = new PVector(5, 8);
  }
  
  void render()
  {
    fill(182, 52, 100);
    noStroke();
    circle(position.x, position.y, 50);
  }
  
  void moveAndBounce()
  {
    position.add(velocity);

    if (position.x > width || position.x < 0)
    {
      velocity.x *= -1;
    }

    if (position.y > height || position.y < 0)
    {
      velocity.y *= -1;
    }
  }
}
