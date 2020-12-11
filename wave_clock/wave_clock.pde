class Point {
  float x;
  float y;
  Point(float x, float y) {
    this.x = x;
    this.y = y;
  }
};

float radius, radiusnoise, _radius;
float angle, anglenoise, rad;
float strokecolor, colorstep;
Point center, point, _point, centernoise;

void setup() {
  size(1920, 1080);
  background(0);
  brightness(1000);
  smooth();
  frameRate(1000);
  strokeWeight(2);
  
  center = new Point(width/2, height/2);
  centernoise = new Point(random(10), random(10));
  angle = 0;
  radius = 300;
  strokecolor = 0;
  colorstep = 1;
  radiusnoise = random(10);
  anglenoise = random(10);
}

void draw() {
  rad = radians(angle);
    
  center.x = width/2 + noise(centernoise.x)*100 - 50;
  center.y = height/2 + noise(centernoise.y)*100 - 50;
      
  _radius = noise(radiusnoise)*radius*1.5;
  point = new Point(center.x + _radius*cos(rad), center.y + _radius*sin(rad));
  _point = new Point(center.x - _radius*cos(rad), center.y - _radius*sin(rad));
    
  stroke(0, strokecolor*0.7, strokecolor, 60);
  line(point.x, point.y, _point.x, _point.y);
    
  strokecolor += colorstep;
  if (strokecolor == 0) {colorstep = 1;}
  else if (strokecolor == 255) {colorstep = -1;}
    
  radiusnoise += 0.005;
  centernoise.x += 0.01;
  centernoise.y += 0.01;
      
  anglenoise += 0.005;
  if (angle > 360) {angle -= 360;}
  else if (angle < 0) {angle += 360;}
      
  angle += noise(anglenoise) - 0.5;
}
