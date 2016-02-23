int GROUND_Y;

PImage img;
float x,y;

float pX = 620;
float pY = 483;
PImage i;

float posX = 60;
float posY = 800;
float velX = 0.0;
float velY = 0.0;
PImage image; 

final float GRAVITY = 0.4; 
final float JUMP = -5.0; 

float camScrollX = 0.0;
float cameraOffsetX;

//float r = random(20);

boolean isOnGround() {
  return (posY >= GROUND_Y);
}

void setup()
  {
    size(800,600);  
    img = loadImage("desert.jpg"); // image is 1600 x 600
    
   
    i = loadImage("raider.jpg"); 
    image = loadImage("biker.jpg");
    
    GROUND_Y = height-135;
    
    fill(150);
  }
  
  void updateCamPos() {
  float scrollSpeed = 1.4f;
  
  float gotoSpot = posX-(width/4); // player 25% from left
  // keep camera from scrolling out of bounds
  if(gotoSpot < 0) {
    gotoSpot = 0;
  }
  if(gotoSpot > img.width-width) {
    gotoSpot = img.width-width;
  }
  
  // have camera chase player position
  if(camScrollX < gotoSpot - scrollSpeed) {
    camScrollX += scrollSpeed;
  }
  if(camScrollX > gotoSpot + scrollSpeed) {
    camScrollX -= scrollSpeed;
  }
}
  
void draw() {
    updateCamPos();
  
  
  
  if(posX<60) {
    posX = 60;
  }
  if(posX>2500) {
    posX = 2500;
  }
  if(pX<60) {
    pX = 60;
  }
  if(pX>2500) {
    pX = 2560;
  }
  //pX += pX + r - 10;
    
  cameraOffsetX = posX-int(width*.4);
  
  posX += velX;
  posY += velY;
  
  if(isOnGround()) { // friction
    velX *= 0.92;
    if(holdingRight) { // no air control here, traction on ground
      velX = 2.5;
    }
    if(holdingLeft) {
      velX = -1.2;
    }
  }
  
  if(isOnGround()) { // on ground to jump
    posY = GROUND_Y;
    velY = 0.0; 
  } else {
    velY += GRAVITY;
  }  
  

  
  
  //  background(0); 
      // not needed as image is bigger than size 
     // and thus overwrites all areas
  x = constrain(x, 0, img.width - width);    
     // ensures that "scrolling" stops at right end of image
  y = constrain(y, 0, img.height - height); 
     // Not needed here, as scolling only in x
  image(img, -x, -450);  
     // overwrites the whole screen with the "shifted" image
  x = posX*2;     
     // advances the image with each new frame
     // do whatever is wanted from here on 
     // like after a call of background();
  stroke(0,0,0);
  //ellipse(mouseX,mouseY,15,15);
  
    
  image(i,pX-40, pY-48);
  
  image(image, posX-40, posY-30);
  
  image(img,-camScrollX,600);
  //rect(posX-20-camScrollX,posY-100,40,100);
  rect(500,375,50,50);
  rect(600,375,50,50);
  rect(550,375,50,50);
    if((posX > 550 && posX < 600) && (posY < 375 && posY > 325)){
      ellipse(560, 325,30,30);  
      fill(35);
    }
  rect(0,img.height-450, img.width, img.height);
}


