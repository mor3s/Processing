// 3D Knots visualisation
// based on coding train video https://youtu.be/r6YMKr1X0VA
// http://paulbourke.net/geometry/knots/
// https://en.wikipedia.org/wiki/Knot_theory

float angle = 0;
ArrayList<PVector> vectors = new ArrayList<PVector>();
float beta = 0;
void setup() {
  size(600, 400, P3D);
   
  
}

void draw() {
  background(0);
  translate(width/2, height/2);
  rotateY(angle);
 
    
  float r = 100 * (0.8 * 1.6 * sin(6 * beta));
  float theta = 2 * beta;
  float phi = 0.6 * PI * sin(12 * beta);
  
  float x = r * cos(phi) * cos(theta);
  float y = r * cos(phi) * sin(theta);
  float z = r * sin(phi);
  
  vectors.add(new PVector(x,y,z));
  
  angle += 0.03;
  beta += 0.01;
  
  noFill();
  strokeWeight(4);
  stroke(255);
  beginShape();
  for (PVector v : vectors) {
    float d = v.mag();
    stroke(255,d,255);
    vertex(v.x,v.y,v.z);
  }
  endShape();
  
}
