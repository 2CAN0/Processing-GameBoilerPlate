class Grid extends GameObject {
  Cell[][] cells;
  PVector gridSize, cellSize;
  float weight;

  public Grid(PVector gridSize, PVector cellSize) {
    this.gridSize = gridSize;
    this.cellSize = cellSize; 
    
    SetupCells();
  }
  
  public Grid(PVector gridSize){
    this.gridSize = gridSize;
    this.cellSize = (width/gridSize.x > height/gridSize.y) ? new PVector(height/gridSize.y, height/gridSize.y) : new PVector(width/gridSize.x, width/gridSize.x);
    
    SetupCells();
  }
  
  public Grid(PVector gridSize, PVector cellSize, PVector bg){
     this.gridSize = gridSize;
     this.cellSize = cellSize;
     
     SetupCells(bg);
  }

  void SetupCells() {
    cells = new Cell[(int)gridSize.x][(int)gridSize.y];

    for (int iRow = 0; iRow < gridSize.y; iRow++) {
      for (int iCol = 0; iCol < gridSize.x; iCol++) {
        cells[iRow][iCol] = new Cell(new PVector(cellSize.x * iCol, cellSize.y * iRow), cellSize);
      }
    }
  }
  
  void SetupCells(PVector bg) {
    cells = new Cell[(int)gridSize.x][(int)gridSize.y];

    for (int iRow = 0; iRow < gridSize.y; iRow++) {
      for (int iCol = 0; iCol < gridSize.x; iCol++) {
        cells[iRow][iCol] = new Cell(new PVector(cellSize.x * iCol, cellSize.y * iRow), cellSize, bg);
      }
    }
  }

  public void draw() {
    for (int iRow = 0; iRow < gridSize.y; iRow++) {
      for (int iCol = 0; iCol < gridSize.x; iCol++) {
        cells[iRow][iCol].draw();
      }
    }
  }
}
