void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
}

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  background(130);
  PVector mouse = mousePos();
  mouse.normalize().mult(250);

  // hilt and blade position (oml im having so many problems with it hdajdahjdabjsdbad)
  float gap = 25;
  
  PVector a = mouse.copy().normalize().mult(gap);
  PVector b = mouse.copy().normalize().mult(250);
  
  // Red glow (Outer left)
  strokeWeight(20);
  stroke(255, 0, 0);
  line(-b.x, -b.y, -a.x, -a.y);
  
  // White glow (Inner left)
  strokeWeight(9);
  stroke(255);
  line(-b.x, -b.y, -a.x, -a.y);
  
  // Red glow (Outer right)
  strokeWeight(20);
  stroke(255, 0, 0);
  line(a.x, a.y, b.x, b.y);
  
  // White glow (Inner right)
  strokeWeight(9);
  stroke(255);
  line(a.x, a.y, b.x, b.y);
  
  // Handle (Middle)
  strokeWeight(15);
  stroke(0);
  line(-a.x, -a.y, a.x, a.y);
  
  println(mouse.mag());
}
