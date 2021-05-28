void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

Walker normalWalker = new Walker();
Walker upBiasedWalker = new Walker();

void draw()
{

 normalWalker.randomWalk();
 normalWalker.render();

 upBiasedWalker.randomWalkBiased();
 upBiasedWalker.render();
}
