class Point {
  float x, y;
  Point(float ex, float why){
    x = ex;
    y = why;
  }
}

float borderX, borderY, param, angle, angleStep;
float radiusNoise, noiseStep;
Point[] cardioid = new Point[360];
Point center;
int count;

Point getPoint(Point center, float param, float rad, float radiusNoise) {
  float x = center.x + param*(1 + pow(cos(rad), 64))*cos(rad);//*noise(radiusNoise);
  float y = center.y - param*(1 + pow(cos(rad), 64))*sin(rad);//*noise(radiusNoise);
  return new Point(x, y);
}

void drawAxes(Point center) {
   stroke(10, 22, 186);
   strokeWeight(2);
   line(borderX, center.y, width-borderX, center.y);
   line(center.x, borderY, center.x, height-borderY);
}

void drawCurve(Point[] curve, int count) {
  stroke(235, 18, 18);
  strokeWeight(2);
  Point last = curve[0];
  for (int i=1 ; i<count ; i++){
    line(curve[i].x, curve[i].y, last.x, last.y);
    last = curve[i];
  }
}

void drawPointer(Point center, Point[] cardioid, int count) {
  Point leader = cardioid[count];
  stroke(12, 119, 23);
  strokeWeight(2);
  line(center.x, center.y, leader.x, leader.y);
  strokeWeight(8);
  point(leader.x, leader.y);
}

void drawFrame(Point center, Point[] cardioid, int count) {
  background(200);
  drawAxes(center);
  drawCurve(cardioid, count);
}

void setup() {
  size(1000,1000);
  frameRate(500);
  smooth();
  borderX = 20;
  borderY = 20;
  angle = 0;
  angleStep = 0.3;
  radiusNoise = random(2);
  noiseStep = 0.5;
  param = 200;
  count = 0;
  center = new Point(width*0.5, height*0.5);
}

void draw() {
  if (angle <= 360) {
    if (count == cardioid.length)
      cardioid = (Point[])expand(cardioid);
    cardioid[count] = getPoint(center, param, radians(angle), radiusNoise);
    drawFrame(center, cardioid, count);
    drawPointer(center, cardioid, count);
    angle += angleStep;
    radiusNoise += noiseStep;
    count++;
  }
  else
    drawFrame(center, cardioid, count);
}
