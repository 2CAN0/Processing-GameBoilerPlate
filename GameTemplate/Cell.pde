class Cell extends GameObject {
  GameObjectList borders = new GameObjectList();
  PVector bg;
  boolean prevEn;

  public Cell(PVector position, PVector size) {
    super(position);
    this.size = size;

    bg = new PVector(255, 255, 255);
    SetupBorders();
  }

  public Cell(PVector position, PVector size, PVector bg) {
    super(position, size);
    this.bg = bg;
    
    SetupBorders();
  }
  

  void Update() { 
    if (prevEn != enabled) {
      for (GameObject gobj : borders.children) {
        gobj.enabled = enabled;
      }
    }

    prevEn = enabled;
  }

  void SetupBorders() {
    // Top Border
    borders.Add(new Border(Position.Top, position, new PVector(position.x + size.x, position.y)));

    // Left Border
    borders.Add(new Border(Position.Left, position, new PVector(position.x, position.y + size.y)));

    // Right Border
    borders.Add(new Border(Position.Right, new PVector(position.x + size.x, position.y), new PVector(position.x + size.x, position.y + size.y)));

    // Bottom Border
    borders.Add(new Border(Position.Bottom, new PVector(position.x, position.y + size.y), new PVector(position.x + size.x, position.y + size.y)));
  }

  public void ToggleWall(Position pos) {
    for (int iBorder = 0; iBorder < borders.children.size(); iBorder++) {
      Border b = (Border)borders.children.get(iBorder);

      if (b.Pos() == pos) {
        borders.children.get(iBorder).enabled = !borders.children.get(iBorder).enabled;
      }
    }
  }

  public void draw() {
    borders.draw();

    noStroke();
    fill(bg.x, bg.y, bg.z);
    rect(position.x, position.y, size.x, size.y);
  }
}

public enum Position {
  Top, 
    Bottom, 
    Left, 
    Right
}

class Border extends GameObject {
  PVector start, end, clr;
  float weight;
  Position pos;

  public Position Pos() { 
    return pos;
  }

  public Border(Position pos, PVector start, PVector end) {
    this.start = start;
    this.end = end;
    this.pos = pos;

    weight = 1;
    clr = new PVector(0, 0, 0);
  }

  public Border(PVector start, PVector end, PVector clr) {
    this.start = start;
    this.end = end;

    this.clr = clr;
    weight = 1;
  }

  public Border(PVector start, PVector end, float weight) {
    this.start = start;
    this.end = end;
    this.weight = weight;

    clr = new PVector(0, 0, 0);
  }

  public Border(PVector start, PVector end, PVector clr, float weight) {
    this.start = start;
    this.end = end;

    this.clr = clr;
    this.weight = weight;
  }

  public void draw() {
    if (enabled) {
      strokeWeight(weight);
      stroke(clr.x, clr.y, clr.z, 255);
      fill(255);
      line(start.x, start.y, end.x, end.y);
    }
  }
}
