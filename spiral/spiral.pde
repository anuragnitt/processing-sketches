float centX, centY;
float angle, param1, param2, step;
float x, y, newX, newY, rad;
float borderX, borderY;
int spiral;

float archimedean_1(float param, float angle){
  return param*angle;
}

float hyperbolic_2(float param, float angle){
  return param/angle;
}

float fermat_3(float param, float angle){
  return param*sqrt(angle);
}

float logarithmic_4(float param,float _param, float angle){
  return param*exp(_param*angle);
}

float distance(int spiral, float angle){
  float result = 0;
  switch(spiral){
    case 1 :
      result = archimedean_1(param1, angle);
    case 2 :
      result = hyperbolic_2(param1, angle);
    case 3 :
      result = fermat_3(param1, angle);
    case 4 :
      result = logarithmic_4(param1, param2, angle);
  }
  return result;
}

void setup(){
  size(700,700);
  stroke(0);
  strokeWeight(1);
  smooth();
  frameRate(1000);
  centX = width/2;
  centY = height/2;
  borderX = 30;
  borderY = 30;
  param1 = 0.005;
  param2 = 0.5;
  step = 0.1;
  angle = 0;
  /*archimedean - 1
  hyperbolic - 2
  fermat - 3
  logarithmic - 4*/
  spiral = 4;
  x = centX + distance(spiral, 0);
  y = centY;
}

void draw(){
  if (abs(x) <= width-borderX && abs(y) <= height-borderY){
    rad = radians(angle);
    newX = centX + distance(spiral, rad)*pow(cos(rad), 1);
    newY = centY + distance(spiral, rad)*pow(sin(rad), 1);
    //line(x, y, newX, newY);
    point(x,y);
    x = newX;
    y = newY;
    angle += step;
  }
}
