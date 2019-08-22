// Double Pendulum simulation
// Based on coding train video https://youtu.be/uWzPe_S-RVE
// https://www.myphysicslab.com/pendulum/double-pendulum-en.html

float r1 = 200;
float r2 = 200;
float m1 = 40;
float m2 = 40;
float a1 = PI/2;
float a2 = PI/8;
float a1_v = 0;
float a2_v = 0;
float a1_a = 0;
float a2_a = 0;
float g = 1;

float px2 = -1;
float py2 = -1;


PGraphics canvas;

void setup() {
  size(1000, 600);
  canvas = createGraphics(width, height);
  canvas.beginDraw();
  canvas.background(255);
  canvas.endDraw();
}

void draw() {

  float a1_a_num = -g*(2*m1+m2)*sin(a1) - m2*g*sin(a1-2*a2) - 2*sin(a1 - a2)*m2*(a2_v*a2_v*r2 + a1_v*a1_v*r1*cos(a1 - a2)); 
  float a1_a_den = r1*(2*m1+m2-m2*cos(2*a1-2*a2));
  a1_a = a1_a_num / a1_a_den;

  float a2_a_num = 2*sin(a1 - a2)*(a1_v*a1_v*r1*(m1+m2) + g*(m1 + m2) * cos(a1) + a2_v*a2_v*r2*m2*cos(a1-a2));
  float a2_a_den = r2*(2*m1 + m2-m2*cos(2*a1-2*a2));
  a2_a = a2_a_num / a2_a_den;


  //background(255);
  image(canvas, 0, 0);
  stroke(0);
  strokeWeight(2);
  fill(0);

  translate(width/2, 50);

  float x1 = r1 * sin(a1);
  float y1 = r1 * cos(a1);
  line(0, 0, x1, y1);
  ellipse(x1, y1, m1, m1);

  float x2 = x1 + r2 * sin(a2);
  float y2 = y1 + r2 * cos(a2);
  line(x1, y1, x2, y2);
  ellipse(x2, y2, m2, m2);

  a1_v += a1_a;
  a2_v += a2_a;

  a1 += a1_v;
  a2 += a2_v;

  //frictions
  a1_v *= 0.9999;
  a2_v *= 0.9999;

  canvas.beginDraw();
  canvas.translate(width/2, 50);
  canvas.strokeWeight(1);
  canvas.stroke(0);
  if (frameCount > 1) {
    canvas.line(px2, py2, x2, y2);
  }
  canvas.endDraw();


  px2 = x2;
  py2 = y2;
}
