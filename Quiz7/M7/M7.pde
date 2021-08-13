Walker[] Walker = new Walker[100];
Walker myWalker = new Walker();
PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

void setup()
{
  size(1280,720, P3D);  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  // Reused my Midterms stuff times are tough but removed stuff that were not needed
  for(int i = 0; i < Walker.length; ++i)
  {
    float gaussianX = randomGaussian();
    float standardDeviationX = 400;
    float meanX = 0;
    float x = standardDeviationX * gaussianX  + meanX;
    
    float gaussianY = randomGaussian();
    float standardDeviationY = 250;
    float meanY = 0;
    float y = standardDeviationY * gaussianY  + meanY;
    
    int randomScale = (int)random(10,30);
    Walker[i] = new Walker();
    Walker[i].position = new PVector(x,y);
    Walker[i].scale = randomScale;
  }
  
  
}

void draw()
{
  background(80);
   
  PVector mouse = mousePos();
  for(int i = 0; i < Walker.length; ++i)
  {
    Walker[i].render();
    PVector direction = PVector.sub(mouse, Walker[i].position);
    direction.normalize().mult(5.2);
    Walker[i].update();
    Walker[i].position.add(direction); 
  }
}
