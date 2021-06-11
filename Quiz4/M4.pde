void setup()
{
  size(1280, 720, P3D);
  background(255);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
}

float elm = 0.03;
Walker perlinWalker = new Walker();

void draw()
{
  fill(0);
  noStroke();

  perlinWalker.perlinWalk();
  perlinWalker.render();
  
      println(noise(elm));
      
      elm += 0.01;
}
