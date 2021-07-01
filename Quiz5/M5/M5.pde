void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0 , 0 , -1, 0);
}

// Instantiate my New and Improved Walker
Walker mahWalker = new Walker();

void draw()
{
  // Uncool way to Walk
  //mahWalker.randomWalk();
  
  // Cool Walk
  //mahWalker.perlinWalk();
  
  // Bouncer
  mahWalker.moveAndBounce();
  
  mahWalker.render();
}
