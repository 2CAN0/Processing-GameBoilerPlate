/*
 Before you start developing your game decide wether your use rectMode CENTER or CORNER.
 This will make the default collision detection easier and more precise.
 */

final int FPS = 60;
PlayingState ps;
InputHelper inputHelper;

void settings() {
  Debug.log("Setting the Debug mode");
  Debug.mode = Debug.Mode.Release;
  
  Debug.log("Setting Window Size");
  //fullScreen(P3D);

  size(900, 900, P3D);
}

void setup() {
  Debug.log("Setting Frame Rate");
  frameRate(FPS);

  Debug.log("Turning stroke off");
  noStroke();

  Debug.log("\nEverything is setup! You're ready to rock");
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
  inputHelper.Update();
}

void keyPressed() {
  inputHelper.keysDown[char(key)] = true;
  inputHelper.keysPressed[char(key)] = true;
}

void keyReleased() {
  inputHelper.keysPressed[char(key)] = false;
}

static class Debug {
  private static Mode mode = Mode.Debug;

  public static void log(Object value) {
    if (mode == Mode.Debug || mode == Mode.Develop)
      println(value);
  }
  
  public static void log(Object value, Mode whenToShow){
    if (mode == whenToShow)
      println(value);
  }

  public enum Mode {
      Debug, 
      Develop, 
      Release
  }
}
