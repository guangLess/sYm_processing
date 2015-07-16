 ArrayList<Particle> particles;
 import java.util.Iterator;

Fuge fuge;
float the;


void setup() {
  size(650,650);
  particles = new ArrayList<Particle>();
  fuge= new Fuge();
  smooth();
  frameRate(33);
}
void draw() {

 background(#082AFF);

  fuge.play();

  particles.add(new Particle(new PVector (mouseX+7*tan(the),mouseY+random(-1,0)+7*(tan(the))/3)));//+10*cos(the))));
  the=the+PI/180;
  
  // Using the iterator 
  Iterator<Particle> it = particles.iterator();
  while (it.hasNext()) {
    Particle p = it.next();
    p.run();
    if (p.isDead()) {
      it.remove();
    }
  }
  
}
  
  class Fuge{
   float a, b,c,d; 
    
  void play(){
  
  a=mouseX;
  b= mouseY;
  c=63;
  noFill();
  stroke(255,255,255);
  rect ( a, b, c, c);
  rect(b, a, c, c);

  rect( width-b, a, c, c);
  rect( width-a, b, c, c);

  /////////////////////////////////////////////////////
  //stroke(255);
  ellipse( a, width-a, c, c);
  ellipse(width-a, width-a, c, c);

  ellipse(width-a, a, c, c);


  ellipse( b, height-b, c, c);
  ellipse(height-b, b, c, c);

  ellipse( height-b, height-b, c, c);

  //stroke(64,126,255);
  ellipse(width/2, b, c, c);
  ellipse(b, width/2, c, c);

  ///////////////////////////////

  ellipse( width/2, height-b, c, c);
  ellipse( height-b, width/2, c, c);

  ellipse( width/2, width-a, c, c);
  ellipse( width-a, width/2, c, c);



  //////////////////////////////////////////////////////////////////////



  ellipse(a, a, c, c);
  ellipse(b, b, c, c);

  ellipse(width/2, a, c, c);
  ellipse(a, width/2, c, c);

  /////////////////////////////////////////////////////////////
  ellipse( a, width-b, c, c);  //only relevent for the x+!=y coordiate
  ellipse( b, width-a, c, c);

  rect(width-b, a, c, c);
  rect(width-a, b, c, c);




  rect( width-a, height-b, c, c);
  rect(width-b, height-a, c, c);

  rect (a, height-b, c, c);
  rect( b, height-a, c, c);
  
  }
  }
class Particle {
  PVector location;
  PVector velocity;
  PVector acceleration;
  float lifespan,the;
  PVector angle,am;
  float bian;


  Particle(PVector l) {
    angle = new PVector(sin(PI/6),tan(PI/9));
    velocity = new PVector(random(-2,-1),random(1,2)); // tobe worked out!!
    am= new PVector( width,height);

    location = l.get();
    lifespan = 255.0;
  }

  void run() {
    update();
    display();
  }

  // Method to update location
  void update() {
    //velocity.add(acceleration);
    //velocity.mult(sin(PI/45));
    location.add(velocity);
    location.add(angle);
    //location.mult(sin(PI/45));
    lifespan -= 3.3;
  }

  void display() {
    

     bian=random(9,random(9,12));

    noStroke();
    if(keyPressed){   fill(255-lifespan,250,lifespan ); }//color
    else 
    fill(lifespan);

    ellipse(location.x,location.y,bian,bian);// mirror o
    ellipse(location.y,location.x,bian,bian);//mirror o 
    ellipse(location.x,height-location.y,bian,bian);//mirror b
   
    if(keyPressed){   
    fill(200-lifespan,lifespan,250); }// color !!!
    else 
    fill(lifespan);
    ellipse( height-location.y,location.x,bian,bian);// mirror b
    ellipse(width-location.x,location.y,bian,bian); //mirror a
    ellipse(location.y,width-location.x,bian,bian); //mirror a
    ellipse(width-location.x,width-location.y,bian,bian);
    ellipse(height-location.y,width-location.x,bian,bian);   
   
  }

  boolean isDead() {
    if (lifespan <0.0) {
      return true;
    } 
    else {
      return false;
    }
  }
}