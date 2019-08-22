// I <3 you !!

ArrayList<PVector> heart = new ArrayList<PVector>();
float a = 0;
int totalFrames = 120;
int counter = 0;
boolean record = false;

void setup() {
  size(400, 400);
}

void draw() {
  float percent = 0;
  if (record) {
    percent = float(counter) / totalFrames;
  } else {
    percent = float(frameCount % totalFrames)/ totalFrames;
  }
  render(percent);
  if (record) {
    saveFrame("output/gif-"+ nf(counter, 3) + "png");
    if (counter == totalFrames) {
      exit();
    }
  }
  counter++;
}


void render(float percent) {
  background(0);
  translate(width/2, height/2);
  fill(150, 0, 100);
  stroke(255);
  strokeWeight(4);
  beginShape();
  for (PVector v : heart) {
    float a = map(percent, 0,1,0, TWO_PI*4);
    float r = map(sin(a), -1, 1, height/40, height/80);
    vertex(r*v.x, r*v.y);
  }
  endShape();
  if (percent <= 0.5) {
    a = map(percent, 0, 0.5, 0, TWO_PI);
    float x = 16 * pow(sin(a), 3);
    float y = -(13 * cos(a)- 5 * cos(2*a)- 2 * cos(3*a)- cos(4*a));
    heart.add(new PVector(x, y));
  }else {
    heart.remove(0);
  }
}
