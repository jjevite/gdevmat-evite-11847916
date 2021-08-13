Walker[] Walker = new Walker[8];
PVector wind = new PVector(0.15, 0.0);


void setup()
{
  size(1280,720, P3D);  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
 resetEverything();
}

void resetEverything()
{
  int posX = -500;
  int posY = 0;
  for(int i = 0; i < Walker.length; ++i)
  {
    posY =  2 * (Window.windowHeight / Walker.length)  * (i - (Walker.length / 2));
    int randomR = (int)random(0,255);
    int randomG = (int)random(0,255);
    int randomB = (int)random(0,255);
    Walker[i] = new Walker();
    Walker[i].mass = 8-i;
    Walker[i].scale = Walker[i].mass *15;
    Walker[i].position = new PVector(posX,posY);
    Walker[i].setColor(randomR, randomG, randomB);
    Walker[i].mew = 0.01f;// cofficient friction
  }
}

void draw()
{
 background(100);
 drawLine();

   
 for(int i = 0; i < Walker.length; ++i)
 {
   if(Walker[i].position.x >= 0)
   {
   Walker[i].mew = 0.4f;
   }
   // Friction = -1 * mew * N *v;
   float normal = 1;
   float frictionMagnitude = Walker[i].mew * normal;
   PVector friction = Walker[i].velocity.copy();
   friction.mult(-1);
   friction.normalize();
   friction.mult(frictionMagnitude);
   Walker[i].applyForce(friction);
   
   PVector acceleration = new PVector(0.2, 0.0);
   Walker[i].render();
   Walker[i].update();
   Walker[i].applyForce(acceleration);
   
  
   if((Walker[i].position.x > Window.right) || (Walker[i].position.x < Window.left))
   {
     Walker[i].position.x = Window.right;
     Walker[i].velocity.x *= -1;
   }
   if((Walker[i].position.y > Window.top) || (Walker[i].position.y < Window.bottom))
   {
     Walker[i].position.y = Window.bottom;
     Walker[i].velocity.y *= -1;
   }
 }
 
}

void drawLine()
{
  fill(0.0);
  line(0, -400,0, 400);
}

void mouseClicked()
{
  resetEverything();
}
