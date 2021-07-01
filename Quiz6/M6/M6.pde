void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, Window.eyeZ, 0, 0, 0 , 0 , -1, 0);
} 

PVector mousePos()
{
  float x = mouseX - Window.windowWidth / 2;
  float y = -(mouseY - Window.windowHeight / 2);
  return new PVector(x, y);
}

void draw()
{
  println(mousePos().x + " " + mousePos().y);
  
  background(127.5);
  
  PVector mouse = mousePos();
  mouse.normalize().mult(300);
  
  
  // Positive Side
  strokeWeight(15);
  stroke(255, 0, 0);
  line(0, 0, mouse.x, mouse.y);
  
  strokeWeight(7);
  stroke(255, 255, 255);
  line(0, 0, mouse.x, mouse.y);
  
  // Negative Side
  strokeWeight(15);
  stroke(255, 0, 0);
  line(0, 0, -mouse.x, -mouse.y);
  
  strokeWeight(7);
  stroke(255, 255, 255);
  line(0, 0, -mouse.x, -mouse.y);
  
  // Printing the Magnitude 
   println(mouse.mag());
  
  // HANDLES
  mouse.normalize().mult(50);
  
  strokeWeight(15);
  stroke(0, 0, 0);
  line(0, 0, mouse.x, mouse.y);
  
  strokeWeight(15);
  stroke(0, 0, 0);
  line(0, 0, -mouse.x, -mouse.y);
  
}
