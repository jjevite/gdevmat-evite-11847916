Walker[] Walker = new Walker[10];
PVector wind = new PVector(0.1, 0.0);

void setup()
{
  size(1280,720, P3D);  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  resetEverything();
}

void resetEverything()
{
  int posX = 0;
  int posY = 300;
  for(int i = 0; i < Walker.length; ++i)
  {
    posX =  2 * (Window.windowWidth /11) * (i-5);
    int randomR = (int)random(0,255);
    int randomG = (int)random(0,255);
    int randomB = (int)random(0,255);
    Walker[i] = new Walker();
    Walker[i].mass = Walker.length  -i;
    Walker[i].scale = Walker[i].mass *10;
    Walker[i].position = new PVector(posX,posY);
    Walker[i].setColor(randomR, randomG, randomB);
  }

  
}

Liquid ocean = new Liquid(0, -100, Window.right, Window.bottom, 0.1f);

void draw()
{
  background(255);
  ocean.render();
  for(int i = 0; i < Walker.length; ++i)
  {
    Walker[i].render();
    Walker[i].update();

    PVector gravity = new PVector(0, -0.15f * Walker[i].mass);
    Walker[i].applyForce(gravity);
    Walker[i].applyForce(wind);
    
    // friction 
    float c = 0.1f;
    float normal = 1;
    float frictionMagnitude = c*normal;
    PVector friction = Walker[i].velocity.copy();
    // F = -uNv;
    Walker[i].applyForce(friction.mult(-1).normalize().mult(frictionMagnitude));
    
    
    if(Walker[i].position.y < Window.bottom)
    {
     Walker[i].position.y = Window.bottom;
     Walker[i].velocity.y *= -1;
    }
    
    if(ocean.isCollidingWith(Walker[i]))
    {
    PVector dragForce = ocean.calculateDragForce(Walker[i]);
    Walker[i].applyForce(dragForce);
    }
  }
}

void mouseClicked()
{
  resetEverything();
}
