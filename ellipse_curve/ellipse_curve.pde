float a, b, centX, centY, x, y;
float angle, rad;
float newx, newy, step;
float radiusNoise;

void setup(){
  size(1000,1000);
  stroke(0);
  strokeWeight(5);
  smooth();
  frameRate(100);
  a = width*0.45;
  b = height*0.2;
  radiusNoise = random(10);
  centX = width/2;
  centY = height/2;
  point(centX, centY);
  strokeWeight(2);
  step = 2;
  x = centX + a;
  y = centY;
}

void draw(){
  if ((x>=0 && x<=width) && (y>=0 && y<=height)){
    rad = radians(angle);
    //float _a = a + (noise(radiusNoise)*200)-100;
    //float _b = b + (noise(radiusNoise)*200)-100;
    newx = centX + a*pow(cos(rad), 1);
    newy = centY + b*pow(sin(rad), 1);
    line(x, y, newx, newy);
    //point(x,y);
    x = newx;
    y = newy;
    angle += step;
    //a += 0.2;
    //b += 0.2;
    radiusNoise += 0.05;
  }
}
