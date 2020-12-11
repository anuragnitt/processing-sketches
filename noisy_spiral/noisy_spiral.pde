size(2048,1080);
background(0);
strokeWeight(1);
brightness(150);
smooth();

int centX = width/2;
int centY = height/2;
float x,y;

//int scalefactor = 12;
//PGraphics highres = createGraphics(width*scalefactor,height*scalefactor, JAVA2D);

//beginRecord(highres);
//highres.scale(scalefactor);

for (int i=0;i<100;i++){
  float lastx = -1;
  float lasty = -1;
  float radiusNoise = random(10);
  float radius = 10;
  
  stroke(random(30),random(30,200),random(30,200),random(255));
  int startangle = int(random(360));
  int endangle = 2650 + int(random(2650));
  int anglestep = 5 + int(random(3));
  
  for (float ang=startangle ; ang<=endangle ; ang+=anglestep){
    radiusNoise += 0.05;
    radius += 0.5;
    float thisRadius = radius + (noise(radiusNoise)*200)-100;
    float rad = radians(ang);
    
    x = centX + (thisRadius*cos(rad));
    y = centY + (thisRadius*sin(rad));
    
    if (lastx > 0)
      line(x,y,lastx,lasty);
      
     lastx = x;
     lasty = y;
  }
}

//endRecord();
//highres.save("noisy_spiral2.png");
