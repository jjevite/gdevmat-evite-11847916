Walker[] Walker = new Walker[10];

void setup()
{
  size(1280,720, P3D);  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  resetEverything();
}

void resetEverything()
{
  for(int i = 0; i < Walker.length; ++i)
  {
    float x = random(-Window.windowWidth, Window.windowWidth);
    float  y = random(-Window.windowHeight, Window.windowHeight);
    
    int randomR = (int)random(0,255);
    int randomG = (int)random(0,255);
    int randomB = (int)random(0,255);
    int mass = (int)random(5,20);

    
    Walker[i] = new Walker();
    Walker[i].mass = mass;
    Walker[i].scale = Walker[i].mass *10;
    Walker[i].position = new PVector(x,y);
    Walker[i].setColor(randomR, randomG, randomB);
  }
}

void draw()
{
  background(255);
  
  for(int i = 0; i < Walker.length; ++i)
  {
    for(int j = 0; j < Walker.length; ++j)
    {
      if (i != j)
      {  
        Walker[i].update();
        Walker[i].render();
        Walker[i].applyForce(Walker[j].calculateAttraction(Walker[i]));
        
        // Uncomment to keep the balls in screen
        // keepInScreen(i);
      }
    }
  }
}

void mouseClicked()
{
  resetEverything();
}

void keepInScreen(int i)
{
   if((Walker[i].position.x > Window.right) || (Walker[i].position.x < Window.left))
        {
          Walker[i].velocity.x *= -1; 
        }
        if((Walker[i].position.y > Window.top) || (Walker[i].position.y < Window.bottom))
        {
           Walker[i].velocity.y *= -1;
        }
}
