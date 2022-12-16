float r;
float noiseF;
float h;
int pngNum;
void setup(){
  colorMode(HSB,360,100,100,100);
  size(600,600);
  r = 400;
  h=random(0,360);
  background(0);
  frameRate(760);
}
void draw(){
  noFill();
  stroke(h,100,100,25);
  translate(frameCount*1.4,height/2);
  beginShape();
    
  for(int i = 0; i<360; i+=1){
    noiseF = noise(i*0.03, float(frameCount)/150);
    float x = r *cos(radians(i))*noiseF;
    float y = r*sin(radians(i))*noiseF;
    curveVertex(x,y);
  }
  endShape();
    
  if (frameCount*1.4>width) {
    saveFrame("output/nft-"+str(pngNum)+".png");
    pngNum+=1;
    frameCount=0;
    h=random(0,360);
    stroke(h,100,100,25);
    background(360,100,0);
    noiseSeed(int(random(0,100000)));
  }
  
}
