class Player {
  PVector position;
  int score = 0;
  final int velocity = 10;

  Player(PVector pos) {
    position = pos;
  }

  void move(String direction) {
    if (direction.equals("UP"))
      position.y -= velocity;
    else if (direction.equals("DOWN"))
      position.y += velocity;
  }

  void checkBounds() {
    if (position.y > height - player_h - bound_h)
      position.y = height - player_h - bound_h;
    else if (position.y < bound_h)
      position.y = bound_h;
  }

  void draw() {
    rect(position.x, position.y, player_w, player_h);
  }
}
