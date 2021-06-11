public class Walker
{
  public float x,
               y,
               z,
               r,
               g,
               b,
               alpha;
          
  public float timeX = 0,
               timeY = 500, 
               timeThick = 1000,
               timeR = 250,
               timeG = 100,
               timeB = 50;
           
  void render()
  {
    // Thickness
    z = map(noise(timeThick), 0, 1, 5, 150);
   
   // Color
   r = map(noise(timeR), 0, 1, 0, 255);
   g = map(noise(timeG), 0, 1, 0, 255);
   b = map(noise(timeB), 0, 1, 0, 255);
   
    timeThick += 0.025f;
    timeR += 0.05;
    timeG += 0.05;
    timeB += 0.05;
    
    
    fill(r, g, b, 255);
    circle(x, y, z);
  }
  
  void perlinWalk()
  {
    x = map(noise(timeX), 0, 1, -640, 640);
    y = map(noise(timeY), 0, 1, -360, 360);
    
    timeX += 0.01f;
    timeY += 0.01f;
  }
}
