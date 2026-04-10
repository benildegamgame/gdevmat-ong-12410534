int globalVariable = 100;
int time = 10000;

float amplitude = 30;
float frequency = 0.05;
float phase = 0;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

void draw()
{
  background(255);
  
  cartesianPlane();
  linearFunction();
  quadraticFunction();
  drawCircle();
  drawSine();
  
  phase += 0.05;
}

void cartesianPlane()
{
  stroke(0);
  strokeWeight(1);
  color black = color(0, 0, 0);
  fill(black);
  stroke(black);
  line(300, 0, -300, 0);
  line(0, -300, 0, 300);
  
  for (int i = -300; i <= 300; i += 10)
  {
    line(i, -3, i, 3);
    line(-3, i, 3, i);
  }
}

void linearFunction()
{
  color purple = color(150, 0, 255);
  fill(purple);
  noStroke();
  
  for (int x = -200; x <= 200; x++)
  {
    circle(x, x + 2, 5);
  }
}

void quadraticFunction()
{
  color green = color(0, 255, 0);
  fill(green);
  noStroke();
  
  for (float x = -300; x <= 300; x += 0.1f)
  {
    circle(x * 10, (float)Math.pow(x, 2) + (2 * x) -5, 5);
  }
}
  
void drawCircle()
{
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  float radius = 50;
  
  for (int x = 0; x <= 360; x++)
  {
    circle((float)Math.cos(x) * radius, (float)Math.sin(x) * radius, 5);
  }
}

void drawSine()
{
  color blue = color(0, 0, 255);
  fill(blue);
  noStroke();

  for (float x = -300; x <= 300; x += 1)
  {
    float y = amplitude * (float)Math.sin(frequency * x + phase);
    circle(x, y, 4);
  }
}

void keyPressed()
{
  if (key == 'w' || key == 'W') amplitude += 5;
  if (key == 's' || key == 'S') amplitude -= 5;

  if (key == 'd' || key == 'D') frequency += 0.01;
  if (key == 'a' || key == 'A') frequency -= 0.01;
}
