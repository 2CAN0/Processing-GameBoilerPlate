/*
 Before you start developing your game decide wether your use rectMode CENTER or CORNER.
 This will make the default collision detection easier and more precise.
*/

final int FPS = 60;
PlayingState ps;
InputHelper inputHelper;

void settings() {

  println("Setting Window Size");

  //fullScreen(P3D);

  size(900, 900, P3D);
}

void setup() {
  println("Setting Frame Rate");
  frameRate(FPS);

  println("Turning stroke off");
  noStroke();

  println("\nEverything is setup! You're ready to rock");
  ps = new PlayingState();
  inputHelper = new InputHelper();
}

void Update() {
  ps.Update();
}

void draw() {
  background(255);
  Update();
  ps.draw();
  inputHelper.draw();
}

void keyPressed() {
  inputHelper.keysDown[char(key)] = true;
  inputHelper.keysPressed[char(key)] = true;
}

void keyReleased() {
  inputHelper.keysPressed[char(key)] = false;
}
