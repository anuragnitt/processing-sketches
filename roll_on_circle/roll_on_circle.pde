float centX_major, centY_major;
float centX_minor, centY_minor;
float radius_major, radius_minor;
float angle, rad, anglestep;
float x, y, lastX, lastY, x0, y0;
int count, scalefactor;

class Point{
  float x, y;
  Point(float X, float Y){
    x = X;
    y = Y;
  }
}

Point[] cycloid = new Point[360];
Point[] ring = new Point[360];

void draw_curve(Point[] array, int count){
  float lastX = array[0].x;
  float lastY = array[0].y;
  
  for (int i=1 ; i<count ; i++){
    line(array[i].x, array[i].y, lastX, lastY);
    lastX = array[i].x;
    lastY = array[i].y;
  }
}

void setup(){
  size(1000, 1000);
  smooth();
  background(200);
  frameRate(500);
  
  centX_major = width/2;
  centY_major = height/2;
  centX_minor = centX_major;
  centY_minor = centY_major - (radius_major + radius_minor);
  
  radius_major = 240;
  radius_minor = 60;
  
  angle = 0;
  anglestep = 0.3;
  count = 0;
  scalefactor = 5;
  
  x0 = x = centX_major;
  y0 = y = centY_major - radius_major;
}

void draw(){
  if (angle <= 360){
    rad = radians(angle);
    centX_minor = centX_major + (radius_major + radius_minor)*sin(rad);
    centY_minor = centY_major - (radius_major + radius_minor)*cos(rad);
    
    x = centX_minor - radius_minor*sin(rad*(1 + (radius_major/radius_minor)));
    y = centY_minor + radius_minor*cos(rad*(1 + (radius_major/radius_minor)));
    
    cycloid[count] = new Point(x, y);
    ring[count] = new Point(centX_minor, centY_minor);
    count++;
    
    if (count == cycloid.length)
      cycloid = (Point[])expand(cycloid);
    if (count == ring.length)
      ring = (Point[])expand(ring);
      
    //PGraphics highres = createGraphics(width*scalefactor, height*scalefactor, JAVA2D);
    //beginRecord(highres);
    //highres.scale(scalefactor);
    
    background(200);
    
    stroke(235, 18, 18);
    strokeWeight(2);
    circle(centX_major, centY_major, radius_major*2);
    
    stroke(12, 119, 23);
    strokeWeight(2);
    circle(centX_minor, centY_minor, radius_minor*2);
    
    stroke(235, 18, 18);
    strokeWeight(9);
    point(centX_major, centY_major);
    stroke(10, 22, 186);
    point(centX_minor, centY_minor);
    stroke(12, 119, 23);
    point(x, y);
    point(x0, y0);
    
    stroke(10, 22, 186);
    strokeWeight(2);
    draw_curve(ring, count);

    stroke(12, 119, 23);
    draw_curve(cycloid, count);
    
    //endRecord();
    //String filename = "C:\\Users\\anura\\Desktop\\Sketches\\ROLL\\frame-" + nf(count, 4) + ".png";
    //highres.save(filename);
    //saveFrame("C:\\Users\\anura\\Desktop\\circle\\frame-####.png");

    angle += anglestep;
  }
}
