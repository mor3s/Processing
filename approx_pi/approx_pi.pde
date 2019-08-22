float r = 200;

int total = 0;
int circle = 0;
double recordPI = 0;

void setup() {
  size(405, 405);
  background(0);
}

void draw() {
   translate(width/2, height/2);
   double pi = 0;
   for (int i = 0; i < 10000; i++) {
   float x = random(-r, r);
   float y = random(-r, r);
   total++;
   
   double d = (double)x*(double)x + (double)y*(double)y;
   if (d < (double)r*(double)r) {
     stroke(0, 255, 0, 100);
     circle++;
   }else {
    stroke(255,100, 0, 100); 
   }
   strokeWeight(1);
   point(x, y);  
   
   } 
   pi = (double)4 * ((double)circle / (double)total);
   
   
   double recordDiff = Math.abs(Math.PI - recordPI);
   double diff = Math.abs(Math.PI - pi);
   if (diff < recordDiff){
     recordDiff = diff;
     recordPI = pi;
     println(recordPI);
     
   }
   
     
}
