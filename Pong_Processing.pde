PVector ball;
int player_w = 20, player_h = 100, ball_size = 20;
int bound_h = 20;
Player player1, player2;
boolean[] keysDown;

void setup() {
  size(1200, 800);
  frameRate(60);
  keysDown = new boolean[256];
  player1 = new Player(new PVector(width - player_w, height / 2 - player_h / 2));
  player2 = new Player(new PVector(0, height / 2 - player_h / 2));
  ball = new PVector(width / 2 - ball_size / 2, height / 2 - ball_size / 2);
}

void keyPressed() {
  if (keyCode < 256) 
    keysDown[keyCode] = true;
}

void keyReleased() {
  if (keyCode < 256) 
    keysDown[keyCode] = false;
}

void draw() {
  background(0);
  noStroke();

  if (keysDown[79]) // O
    player1.move("UP");
  if (keysDown[76]) // L
    player1.move("DOWN");
  if (keysDown[87]) // W
    player2.move("UP");
  if (keysDown[83]) // S
    player2.move("DOWN");

  player1.checkBounds();
  player2.checkBounds();

  // Drawing section

  fill(255);
  rect(0, 0, width, bound_h); // Draw bounds
  rect(0, height - bound_h, width, bound_h);

  fill(128);
  for (int i = bound_h; i < height - bound_h; i += 60) {
    rect(width / 2 - 5, i, 10, 40); // Draw center line
  }

  fill(255);
  player1.draw();
  player2.draw();

  rect(ball.x, ball.y, ball_size, ball_size); // Draw ball
}
