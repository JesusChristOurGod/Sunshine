float r;
float noiseF;
boolean direction;
float h;
void setup(){
  colorMode(HSB,360,100,100,100);
  fullScreen();
  r = 500;
  h=random(0,360);
  direction = true;
  background(0);
}
void draw(){
   noFill();
   stroke(h,100,100,25);
  if (direction){
    translate(width/2,frameCount*1.4);
    beginShape();
    
    for(int i = 0; i<360; i+=1){
      noiseF = noise(i*0.03, float(frameCount)/150);
      float x = r *cos(radians(i))*noiseF;
      float y = r*sin(radians(i))*noiseF;
      curveVertex(x,y);
    }
    endShape();
    
    if (frameCount%height==0){
      direction = false;
      frameCount=0;
      background(0);
      noiseSeed(int(random(0,100)));
      h = random(0,360);
    }
  }
  else{
    translate(frameCount*1.4,height/2);
    beginShape();
    
    for(int i = 0; i<360; i+=1){
      noiseF = noise(i*0.03, float(frameCount)/150);
      float x = r *cos(radians(i))*noiseF;
      float y = r*sin(radians(i))*noiseF;
      curveVertex(x,y);
    }
    endShape();
    
    if (frameCount%width==0){
      direction = true;
      frameCount=0;
      background(0);
      noiseSeed(int(random(0,100)));
      h = random(0,360);

    }
  }
  //saveFrame(
}
