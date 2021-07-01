public class Walker
{
  PVector position = new PVector();
  
  // For my bouncer 
  PVector speed = new PVector(5,8);
  
  // For my perlinWalk
  PVector time = new PVector(0, 500);
  PVector increment = new PVector(0.01f, 0.01f);
  
  // For my randomWalk 
  // I used a simple integer 10 for increment 
  
  // a.k.a the draw() function 
  void render()
  {
    background(255);
    
    fill(182, 52, 100, 255);
    circle(position.x, position.y, 50);
  }
  
  // Fixing RandomWalk() to using Vectors
   void randomWalk()
  {
    int rng = (int)random(8);
    
   
    if (rng == 0)
    {
      position.x+= 10;
    }
    else if(rng == 1)
    {
      position.x-= 10;
    }
    else if(rng == 2)
    {
      position.y+= 10;
    }
    else if(rng == 3)
    {
      position.y-= 10;
    }
    
    // Lower Left
    else if(rng == 4)
    {
      position.y-= 10;
      position.x-= 10;
    }
    
    // Lower Right
    else if(rng == 5)
    {
      position.y-= 10;
      position.x+= 10;
    }
    
    // Upper Right
    else if(rng == 6)
    {
      position.y+= 10;
      position.x+= 10;
    }
    
    // Upper Left
    else if(rng == 7)
    {
      position.y+= 10;
      position.x-= 10;
    }
  }
  
  // Fixing perlinWalk() to use Vectors
  void perlinWalk()
  {
    position.x = map(noise(time.x), 0, 1, -640, 640);
    position.y = map(noise(time.y), 0, 1, -360, 360);
    
    time.add(increment);
  }
    
  // Bouncers
  void moveAndBounce()
  {
    position.add(speed);
    
    if((position.x > Window.right) || (position.x < Window.left))
    {
      speed.x *= -1;
    }
    
    if((position.y > Window.top) || (position.y < Window.bottom))
    {
      speed.y *= -1;
    }
  }
}
