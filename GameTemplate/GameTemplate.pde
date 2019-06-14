final int FPS = 60;
PlayingState ps;

void settings() {

  println("Setting Window Size");

  //fullScreen(P3D);

  size(900, 500, P3D);
}

void setup() {
  println("Setting Frame Rate");
  frameRate(FPS);
  
  println("Turning stroke off");
  noStroke();
  
  println("\nEverything is setup! You're ready to rock");
  ps = new PlayingState();
}

void Update(){
  ps.Update();
}

void draw() {
  background(255);
  Update();
  ps.draw();
}
