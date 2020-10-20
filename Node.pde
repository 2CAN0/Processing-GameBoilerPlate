class Node extends Cell {
  ArrayList<Node> neighbours;
  boolean visited;
  PVector visitedBg;

  public Node(PVector position, PVector size) {
    super(position, size);

    SetupBorders();

    visited = false;
    bg = new PVector(255, 255, 255);
    visitedBg = new PVector(0, 0, 0);
  }

  public Node(PVector position, PVector size, PVector bg, PVector visitedClr) {
    super(position, size);
    this.bg = bg;
    this.visitedBg = visitedClr;

    SetupBorders();

    visited = false;
  }

  public void Visit() {
    visited = true;
  }

  public boolean IsVisited() {
    return visited;
  }

  public void AddNeighbour(Node node) {
    neighbours.add(node);
  }

  public void draw() {
    super.draw();

    if (visited)
      fill(visitedBg.x, visitedBg.y, visitedBg.z);
    else
      fill(bg.x, bg.y, bg.z);

    rect(getGlobalPositino().x, getGlobalPositino().y, size.x, size.y);
  }
}
