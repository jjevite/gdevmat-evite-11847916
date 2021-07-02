Mover[] mover = new Mover[100];
Mover blackHole;


PVector mousePos()
{
  float x = mouseX - Window.windowWidth;
  float y = -(mouseY - Window.windowHeight);
  return new PVector(x, y);
}

int value;

void setup()
{
  size(1280, 720, P3D);

  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);

  // Position and Color of BlackHole
  // Simple Random and static int on the color (black), 50 on scale
  float randomX = (int)random(Window.left, Window.right);
  float randomY = (int)random(Window.bottom, Window.top);
  blackHole = new Mover(randomX, randomY, 50);
  blackHole.setColor(0,0,0, 255);
  
  // Position and Color of each movers
  for(int i = 0; i < mover.length; ++i)
  {
    // Gaussian as Required on the position and 
    // Simple random on Color, Alpha, and Scale
    float gaussianX = randomGaussian();
    float standardDeviationX = 400;
    float meanX = 0;
    float x = standardDeviationX * gaussianX  + meanX;
    
    float gaussianY = randomGaussian();
    float standardDeviationY = 250;
    float meanY = 0;
    float y = standardDeviationY * gaussianY  + meanY;
    
    int randomR = (int)random(0,255);
    int randomG = (int)random(0,255);
    int randomB = (int)random(0,255);
    int randomAlpha = (int)random(127.5,255);
    int randomScale = (int)random(10,30);
    mover[i] = new Mover(x, y, randomScale);
    mover[i].setColor(randomR,randomG,randomB, randomAlpha);
  }
}

void draw()
{ 
   background(25.5);
   
   // Mouse Movement Uncomment to move the blackhole to your mouse
   // Although it disables the random spawn of blackhole because it follows the mouse 
   /*
   PVector mouse = mousePos();
   blackHole.setPosition(mouse);
   */
   
  for(int i = 0; i < mover.length; ++i)
  {
    mover[i].render();
    PVector direction = PVector.sub(blackHole.position, mover[i].position);
    direction.normalize().mult(5);
    mover[i].position.add(direction); 
  }
  
  blackHole.renderWithStroke();
  
  // Evaluator For Canvass Reset
  value = frameCount % 300;
  println("value mod:" + value);
  println(frameCount);
  if(value == 0)
  {
    setup();
  }
}

// Added Reset When Mouse is Clicked For Fun pls no deductions
void mouseClicked()
{
  setup();
}
