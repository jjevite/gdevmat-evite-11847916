// For my flush screen loop
int i = 300;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
  background(255);
}

void draw()
{
  // Hard Coded Flushing of Screen every 300 frames :^)
   if(frameCount == i)
  {
    i += 300;
    background(255);
  }
 
 
  //  x coord gaussian random
  float gaussian = randomGaussian();
  float standardDeviation = 200;
  float mean = 0;
  float x = standardDeviation * gaussian  + mean;
  
  // y coord random
  int y = (int)random(-325, 325);
  
  // Thickness gaussian random
  float thickgaussian = randomGaussian();
  float thickSD = 30;
  float thickM = 15;
  float finalThickness = thickSD * thickgaussian + thickM;
  
  // Color RNG
  int rngRed = (int)random(255);
  int rngGreen = (int)random(255);
  int rngBlue = (int)random(255);
  int rngAlphaAf = (int)random(10, 100);
    
  noStroke();
  fill(rngRed, rngGreen, rngBlue, rngAlphaAf);
  fill(rngRed, rngGreen, rngBlue, rngAlphaAf);
  circle(x, y, finalThickness);
}
