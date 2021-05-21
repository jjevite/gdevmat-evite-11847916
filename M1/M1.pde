int amplitude = 25;
int frequency = 19;

void setup()
{
  size(1280, 720, P3D);
  camera(0, 0, -(height/2.0) / tan(PI*30.0 / 180.0), 0, 0, 0, 0, -1, 0);
  
}

void draw()
{
  background(0);
  
  
  drawCartesianPlane();
  drawQuizNumber1();
  drawQuizNumber2();
 
  drawQuizNumber3();
}

void drawCartesianPlane()
{
    strokeWeight(2);
  color white = color(255, 255, 255);
  fill(white);
  stroke(white);
  line(300, 0, -300, 0);
  line(0, -300,0, 300);
  
  for(int i = -300; i <= 300; i += 10)
  {
    line(i, -2, i , 2);
    line(-2, i, 2, i);
  }
}

// Quad Func
void drawQuizNumber1()
{  
  /*
    x2−15x−3  (yellow color)
    
  */
  color yellow = color(255, 255, 0);
  fill(yellow);
  stroke(yellow);
  noStroke();  
  
  for(float x = -300; x <= 300; x+= 0.1f)
  {
    
    circle(x, (x * x) -(15 * x) - 3, 5);
  }
  
}

// Linear Func
void drawQuizNumber2()
{  
  /*
    −5x +30 (purple color)
    
  */
  color purple = color(128, 0,128);
  fill(purple);
  stroke(purple);
  noStroke();
    
  
  for(float x = -300; x <= 300; x+= 0.1f)
  {
    
    circle(x, (-5 * x) + 30, 5);
  }
  
}

// Sin Wave
void drawQuizNumber3()
{  
  /*
    sine wave (red color)
    
  */
  color red = color(255, 0,0);
  fill(red);
  stroke(red);
  noStroke();
  
  for(float x = -250; x <= 250; x++)
  {
    
    circle(x, amplitude *  (float)Math.sin(x * frequency), 5);
  }
}


// Bonus 2 pless
public void keyPressed()
{
   
    println("Key code pressed: " + keyCode);
     
    if (key == 'q')
    {
      frequency--;
      println(frequency);
      
    }
     else if (key == 'w')
    {
      frequency++;
      println(frequency);
      
    }
    
    else if (key == 'a')
    {
      amplitude--;
      println(amplitude);
      
    }
    else if (key == 's')
    {
      amplitude++;
      println(amplitude);
      
    }
  
         
}
