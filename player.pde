class Player {
  PVector position;
  String side;
  int score = 0;
  final int w = 20, h = 100, velocity = 12;

  Player(String s) {
    if(s == "LEFT")
      position = new PVector(0, height / 2 - h / 2);
    else if(s == "RIGHT")
      position = new PVector(width - w, height / 2 - h / 2);
  }

  void move(String direction) {
    if (direction.equals("UP"))
      position.y -= velocity;
    else if (direction.equals("DOWN"))
      position.y += velocity;
  }

  void checkBounds() {
    if (position.y > height - h - bound_h) // bottom bound
      position.y = height - h - bound_h;
    else if (position.y < bound_h) // top bound
      position.y = bound_h;
  }

  void draw() {
    rect(position.x, position.y, w, h);
  }
}
