void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  background(0);
}

int frameReset = 0;

void draw()
{
  float gaussianX = randomGaussian();
  float gaussianSize = randomGaussian();

  float standardDeviationX = 200;
  float meanX = width / 2;
  float x = standardDeviationX * gaussianX + meanX;

  float y = random(0, height);

  float standardDeviationSize = 10;
  float mean = 20;
  float size = abs(standardDeviationSize * gaussianSize + mean);
  
  noStroke();
  fill(random(255), random(255), random(255), random(10, 100));
  circle(x, y, size);
  
  frameReset++;
  if (frameReset > 300)
  {
    background(0);
    frameReset = 0;
  }
}
