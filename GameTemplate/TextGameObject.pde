class TextObject extends GameObject {
  String text;
  int fontSize;

  public TextObject(String text, PVector position) {
    super(position);
    this.text = text;
    fontSize = 11;
  }

  public TextObject(String text, PVector position, int fontSize) {
    super(position);
    this.text = text;
    this.fontSize = fontSize;
  }

  public TextObject(String text) {
    super(new PVector(width/2, height/2));
    this.text = text;
    fontSize = 11;
  }
  
  public TextObject(String text, int fontSize){
     super(new PVector(width/2, height/2));
     this.text = text;
     this.fontSize = fontSize;
  }

  void UpdateText(String value) {
    text = value;
  }

  void UpdatePosition(PVector position) {
    this.position = position;
  }

  public void draw() {
    textSize(fontSize);
    text(text, position.x, position.y);
  }
}
