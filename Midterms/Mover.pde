public class Mover
{
   public PVector position;
   public float scale = 50;
   public float r = 255, g = 255, b = 255, a = 255;
   
  // The template you provided 
  // added setposition for the blackhole mouse function 
  // and render with stroke for the blackhole event horizon effect (very scuffed tho)
   Mover()
   {
      position = new PVector(); 
   }
   
   Mover(float x, float y)
   {
      position = new PVector(x, y);
   }
   
   
   Mover(float x, float y, float scale)
   {
      position = new PVector(x, y);
      this.scale = scale;
   }
   
   Mover(PVector position)
   {
      this.position = position; 
   }
   
   Mover(PVector position, float scale)
   {
      this.position = position; 
      this.scale = scale;
   }
   
   // I tried bluring it to make it look like an event horizon thing but it slowed down the program
   public void renderWithStroke()
   {
     fill(r,g,b,a);
     stroke(234, 148, 6);
     strokeWeight(.75);
     circle(position.x, position.y, scale); 
   }
   
   public void render()
   {
      fill(r,g,b,a);
      noStroke();
      circle(position.x, position.y, scale); 
   }
   
   public void randomWalk()
   {
      float decision = random(0, 4);
      
      if (decision == 0)
      {
         position.x ++; 
      }
      else if (decision == 1)
      {
         position.x --; 
      }
      else if (decision == 2)
      {
         position.y ++; 
      }
      else if (decision == 3)
      {
         position.y --; 
      }
   }
   
   public void setColor(float r, float g, float b, float a)
   {
      this.r = r;
      this.g = g;
      this.b = b;
      this.a = a;
   }
   
   public void setPosition(PVector pos)
   {
     this.position = pos;
   }
}
