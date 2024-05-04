int bound_h = 10, line_w = 6;
boolean[] keysDown;
boolean menu = true, game_over = false;
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

  if(!menu && !game_over) {
    if (keysDown[79]) // O
      player1.move("UP");
    if (keysDown[76]) // L
      player1.move("DOWN");
    if (keysDown[87]) // W
      player2.move("UP");
    if (keysDown[83]) // S
      player2.move("DOWN");
      
    ball.move();
  }
  
  //if(key == 'x' && !menu)
    //game_over = true;
  
  // Checking section:

  player1.checkBounds();
  player2.checkBounds();
  ball.checkCollision();
  ball.checkScore();
  
  if(player1.score == 11 || player2.score == 11)
    game_over = true;

  // Drawing section:
 
  fill(255);
  rect(0, 0, width, bound_h); // Draw top bound
  rect(0, height - bound_h, width, bound_h); // Draw bottom bound

  fill(150);
  if(!menu && !game_over) {
    for (int i = bound_h + 10; i < height - bound_h; i += 60) {
      rect(width / 2 - line_w / 2, i, line_w, 40); // Draw dashed center line
    }
  }

  fill(255);
  if(!menu)
    ball.draw();
  player1.draw();
  player2.draw();
  
  if(!menu) {
    fill(255);
    textAlign(CENTER , CENTER);
    textSize(40);
    text(player1.score, width / 4 * 3, height / 4);
    text(player2.score, width / 4, height / 4);
  }
  
  if(game_over) {
    String left_txt = "WINNER", right_txt = "LOSER";
    
    if(player1.score > player2.score) {
      left_txt = "LOSER"; right_txt = "WINNER";
    }
    
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(60);
    text(right_txt, width / 4 * 3, height / 2);
    text(left_txt, width / 4, height / 2);
    
    textSize(40);
    text("Press SPACE to play again", width / 2, height / 2 + 300);
    
    if(keyPressed && key == ' ') {
      player1.reset("RIGHT");
      player2.reset("LEFT");
      ball.reset();
      game_over = false;
    }
  }
  
  if(menu) {
    fill(255);
    textAlign(CENTER, CENTER);
    textSize(40);
    
    text("↑  O", width / 6 * 5, height / 4);
    text("↓  L", width / 6 * 5, height / 4 * 3);
    text("W  ↑", width / 6, height / 4);
    text("S  ↓", width / 6, height / 4 * 3);

    textSize(150);
    text("PONG", width / 2, height / 2 - 35);
    
    textSize(40);
    text("Press SPACE to start", width / 2, height / 2 + 65);
    
    textSize(20);
    text("v1.0", width - 40, 40);
    text("Made by Paweł Sampir (2024)", width / 2, height - 40);
    
    if(keyPressed && key == ' ') {
      menu = false;
    }
  
  }
  
}
