public class Walker
{
  public PVector position = new PVector();
  public PVector velocity = new PVector();
  public PVector acceleration = new PVector();

  public float velocityLimit = 10;
  public float scale = 15;   
  
  public float mass = 1;

  public float r = 255, g = 255, b = 255, a = 50;
  
  public float gravitationalConstant = 1;
  
  public Walker()
  {
    
  }
  
  public void setColor(float r, float g, float b)
  {
      this.r = r;
      this.g = g;
      this.b = b;
  }
  
  public void applyForce(PVector force)
  {
    PVector f = PVector.div(force, this.mass); 
    this.acceleration.add(f);
  }
  
  public void update()
  {
    //this.acceleration = PVector.random2D();
    this.velocity.add(this.acceleration);
    this.velocity.limit(velocityLimit);
    this.position.add(this.velocity);;
    this.acceleration.mult(0);
  }
  

  
  void render()
  {
    noStroke();
    fill(r,g,b,a);
    circle(position.x, position.y, scale);
  }
  
  public void checkEdges()
  {
    if(this.position.x > Window.right)
    {
       this.position.x = Window.left; 
    }
    else if(this.position.x < Window.left)
    {
       this.position.x = Window.right; 
    }
    
     if(this.position.y > Window.top)
    {
       this.position.y = Window.bottom; 
    }
    else if(this.position.y < Window.bottom)
    {
       this.position.y = Window.top  ; 
    }
  }
  
  public PVector calculateAttraction(Walker walker)
  {
    PVector force = PVector.sub(this.position, walker.position); // direction
    float distance = force.mag();
    force.normalize(); // normalize to accurately get direction
    
    distance = constrain(distance, 5, 25); //solves dividing by 0 , and dividing by tiny values
    
    float strength = (this.gravitationalConstant * this.mass * walker.mass) / (distance*distance);
    force.mult(strength);
    return force;
  }
}
