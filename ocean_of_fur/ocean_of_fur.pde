float xStart, xNoise, yNoise;
int x, y;
float red, green, blue, alpha;
float contrast;

void setup() {
  size(1920, 1080);
  smooth();
  frameRate(1000);
  background(0);
  brightness(200);
  contrast = 10;

  xStart = random(10);
  xNoise = xStart;
  yNoise = random(10);

  //int scale = 2;
  //PGraphics highres = createGraphics(width*scale, height*scale, JAVA2D);
  //beginRecord(highres);
  //highres.scale(scale);

  for (y=0 ; y<=height ; y+=5){
    yNoise += 0.1;
    xNoise = xStart;
    for (x=0 ; x<=width ; x+=5){
      xNoise += 0.1;
      drawPoint(x, y, noise(xNoise, yNoise));
    }
  }
  
  //endRecord();
  //highres.save("C:\\Users\\anura\\Desktop\\fur.jpeg");
}

float getColor(float seed, float contrast){
  float F = (259*(contrast+255))/(255*(259-contrast));
  return F*(random(255*seed)-128)+128;
}

void drawPoint(float x, float y, float seed){
  contrast = random(-10*seed, 10*seed);
  red = getColor(seed, contrast);
  green = getColor(seed, contrast);
  blue = getColor(seed, contrast);
  
  stroke(red, green, blue, random(255*seed));
  strokeWeight(2*seed);
  
  pushMatrix();
  translate(x, y);
  rotate(seed*2*PI);
  line(0,0,25,0);
  popMatrix();
}
