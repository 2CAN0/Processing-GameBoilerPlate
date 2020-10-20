class PlayingState extends GameObjectList {
  Grid grid;

  public PlayingState() {
    this.Add(grid = new Grid(new PVector(160, 90)))
  }

  public void Update() {
    
  }
}
