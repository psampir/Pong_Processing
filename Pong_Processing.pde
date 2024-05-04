int bound_h = 10, line_w = 6;
boolean[] keysDown;
Player player1, player2;
Ball ball;

void setup() {
  size(1200, 800);
  frameRate(60);
  keysDown = new boolean[256];
  player1 = new Player("RIGHT");
  player2 = new Player("LEFT");
  ball = new Ball();
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
  
  // Moving section:

  if (keysDown[79]) // O
    player1.move("UP");
  if (keysDown[76]) // L
    player1.move("DOWN");
  if (keysDown[87]) // W
    player2.move("UP");
  if (keysDown[83]) // S
    player2.move("DOWN");
    
  ball.move();
  
  // Checking section:

  player1.checkBounds();
  player2.checkBounds();
  ball.checkCollision();
  ball.checkScore();

  // Drawing section:
  
  fill(255, 0, 0, 200);
  textSize(30);
  text("P1: " + player1.score, 20, 50);
  text("P2: " + player2.score, 20, 80);

  fill(255);
  rect(0, 0, width, bound_h); // Draw top bound
  rect(0, height - bound_h, width, bound_h); // Draw bottom bound

  for (int i = bound_h + 10; i < height - bound_h; i += 60) {
    rect(width / 2 - line_w / 2, i, line_w, 40); // Draw dashed center line
  }

  ball.draw();
  player1.draw();
  player2.draw();
  
}
