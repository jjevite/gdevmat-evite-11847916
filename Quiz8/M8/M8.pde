Walker[] Walker = new Walker[10];
PVector gravity = new PVector(0.0, -0.4);
PVector wind = new PVector(0.15, 0.0);


void setup()
{
  size(1280,720, P3D);  
  camera(0, 0, Window.eyeZ, 0, 0, 0, 0, -1, 0);
  
  int mass = 1;
  for(int i = 0; i < Walker.length; ++i)
  {
    int randomR = (int)random(0,255);
    int randomG = (int)random(0,255);
    int randomB = (int)random(0,255);
    Walker[i] = new Walker();
    Walker[i].mass = mass;
    Walker[i].scale = Walker[i].mass *15;
    Walker[i].position = new PVector(-500,200);
    Walker[i].setColor(randomR, randomG, randomB);
    mass++;
  }
}

void draw()
{
  background(80);
 
 for(int i = 0; i < Walker.length; ++i)
 {
   Walker[i].render();
   Walker[i].update();
   Walker[i].applyForce(wind);
   Walker[i].applyForce(gravity);
  
   if((Walker[i].position.x > Window.right) || (Walker[i].position.x < Window.left))
   {
     Walker[i].velocity.x *= -1;
   }
   if((Walker[i].position.y > Window.top) || (Walker[i].position.y < Window.bottom))
   {
     Walker[i].velocity.y *= -1;
   }
 }
 
}
