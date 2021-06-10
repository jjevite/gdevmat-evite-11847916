class Walker
{
  float x, y;
  
  void render()
  {
     int rngRed = (int)random(255);
     int rngGreen = (int)random(255);
     int rngBlue = (int)random(255);
     int rngAlphaAf = (int)random(50, 100);
     
    fill(rngRed, rngGreen, rngBlue, rngAlphaAf);
    circle(x, y, 30);
  }
  

  
  void randomWalk()
  {
    int rng = (int)random(8);
    
   
    if (rng == 0)
    {
      x+= 10;
    }
    else if(rng == 1)
    {
      x-= 10;
    }
    else if(rng == 2)
    {
      y+= 10;
    }
    else if(rng == 3)
    {
      y-= 10;
    }
    
    // Lower Left
    else if(rng == 4)
    {
      y-= 10;
      x-= 10;
    }
    
    // Lower Right
    else if(rng == 5)
    {
      y-= 10;
      x+= 10;
    }
    
    // Upper Right
    else if(rng == 6)
    {
      y+= 10;
      x+= 10;
    }
    
    // Upper Left
    else if(rng == 7)
    {
      y+= 10;
      x-= 10;
    }
   
  }
  
  void randomWalkBiased()
  {
    // I got this method  from my gacha quiz 4 during BASPRG2 


    // Put a weight on all the items
    float up = 0.5;
    float down= 0.25;
    float left = 0.25;
    float right = 0.25;
    float upRight = 0.25;
    float upLeft = 0.25;
    float downRight = 0.25;
    float downLeft = 0.25;
    
    // Add all of the items
   float sum = up + down + left + right + upRight + upLeft + downRight + downLeft;
       
     // use the sum as max for the rand func
          float rng = random(sum);
         
         // for checking if I did it right
        println(rng);
        
        // if rng value 0.0 -> 0.5 go UP
    if (rng <= up)
    {
         y+= 10;
    }
    
    // if rng value is less than the sum of all items go to another rng checker for individual checking
  
    else if (rng <= sum)
    {
      int irng = (int)random(7);
      
  
     if(irng == 0)
    {
      y-= 10;
    }
    else if(irng == 1)
    {
      x-= 10;
    }
    else if(irng == 2)
    {
      x+= 10;
    }
    
    // Lower Left
     else if (irng == 3)
    {
      y-= 10;
      x-= 10;
    }
    
    // Lower Right
    else if(irng == 4)
    {
      y-= 10;
      x+= 10;
    }
    
    // Upper Right
    else if(irng == 5)
    {
      y+= 10;
      x+= 10;
    }
    
    // Upper Left
    else if(irng == 6)
    {
      y+= 10;
      x-= 10;
    }
      
    }
    
    
  }
  
}
