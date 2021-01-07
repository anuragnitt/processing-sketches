class Point {
  float x, y;
  
  Point(float ex, float why) {
    this.x = ex;
    this.y = why;
  }
  
  void set(float ex, float why) {
    this.x = ex;
    this.y = why;
  }
};

class Recaman {
  int step, num, count;
  int[] visited;
  boolean init;
  
  Recaman() {
    step = 0;
    num = 0;
    count = 0;
    visited = new int[100];
    init = true;
  }
  
  boolean is_visited(int n) {
    boolean found = false;
    for (int i=0 ; i<this.visited.length ; i++) {
      if (this.visited[i] == n) {
        found = true;
        break;
      }
    }
    return found;
  }
  
  void append(int n) {
    if (this.count == this.visited.length)
      this.visited = (int[])expand(this.visited);
    this.visited[count] = n;
    this.count ++;
  }
  
  int generate() {
    if (this.init == true)
      this.init = false;
    else if (this.num - this.step < 0)
      this.num += this.step;
    else if (this.is_visited(this.num - this.step))
      this.num += this.step;
    else
      this.num -= this.step;
    this.step ++;
    this.append(this.num);
    return this.num;
  }
};

Recaman seq = new Recaman();
Point A, B, center;
PShader neon;
PGraphics highres;
float scale_x, diam;
int limit, res_scale;
boolean arc_up;

void setup() {
  scale_x = 10;
  limit = 110;
  arc_up = false;
  A = new Point(seq.generate()*scale_x, height/2);
  B = new Point(0, 0);
  center = new Point(0, 0);
  res_scale = 5;
  
  neon = loadShader("neon.glsl");
  /*highres = createGraphics(width*res_scale, height*res_scale, JAVA2D);
  beginRecord(highres);
  highres.scale(res_scale);*/
  
  size(1920, 1080, P3D);
  background(0);
  smooth();
  beginShape();
  noFill();
}

void draw() {
  for (int i=0 ; i < limit ; i++) {
    B.set(seq.generate()*scale_x, height/2);
    center.set((A.x + B.x)/2, (A.y + B.y)/2);
    diam = 2*sqrt(pow(center.x - A.x, 2) + pow(center.y - A.y, 2));
    A.set(B.x, B.y);
    
    strokeWeight(1);
    stroke(255*noise(i/1.0), 255-255*noise(i/1.0), 255);
    
    if (arc_up == true)
      arc(center.x, center.y, diam, diam, PI, TWO_PI);
    else
      arc(center.x, center.y, diam, diam, 0, PI);

    arc_up = !arc_up;
  }
  endShape();
  filter(neon);
  stop();
  /*endRecord();
  highres.save("recaman.png");*/
}
