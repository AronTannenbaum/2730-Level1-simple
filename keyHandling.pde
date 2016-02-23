boolean holdingRight = false;
boolean holdingLeft = false;
boolean holding_ = false;

void keyPressed() {
  if(keyCode == RIGHT) {
    holdingRight = true;
  }
  if(keyCode == LEFT) {
    holdingLeft = true;
  }
  if(key == ' ' && isOnGround()) {
    velY += JUMP;
  }
  if(key == ' ' && velY == 0) {
    for(int i = 0; i < 1;i++){
      velY += JUMP;
    }
  }
}

void keyReleased() {
  if(keyCode == RIGHT) {
    holdingRight = false;
  }
  if(keyCode == LEFT) {
    holdingLeft = false;
  }
}

