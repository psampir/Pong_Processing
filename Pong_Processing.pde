PVector ball;
int player_w = 20, player_h = 100, ball_size = 20;
int boundary_h = 20;
player player1, player2;
boolean[] keysDown;
boolean bHigh = false;

class player {
  PVector position;
  int score = 0;
  final int velocity = 10;
  
  player(PVector pos) {
    position = pos;
  }
  
  void move(String direction) {
    if(direction == "UP")
      position.y -= velocity;
    else if(direction == "DOWN")
      position.y += velocity;
  }
  
  void check_bounds() {
    if(position.y > height - player_h - boundary_h)
      position.y = height - player_h - boundary_h;
    else if(position.y < boundary_h)
      position.y = boundary_h;
  }
  
  void draw() {
    rect(position.x, position.y, player_w, player_h);
  }
}

void setup() {
  size(1200, 800);
  frameRate(60);
  keysDown = new boolean[256];
  
  player1 = new player(new PVector(width - player_w, height / 2 - player_h / 2));
  player2 = new player(new PVector(0, height / 2 - player_h / 2));
  ball = new PVector(width / 2 - ball_size / 2, height / 2 - ball_size / 2);
}

void keyPressed() {
  if(keyCode < 256) 
    keysDown[keyCode] = true;
  else bHigh = true;
}

void keyReleased() {
  if(keyCode < 256) 
    keysDown[keyCode] = false;
  else bHigh = false;
}

void draw() {
  
  background(0);
  noStroke();
          
  if(keysDown[79]) 
    player1.move("UP"); // move players
  if(keysDown[76])
    player1.move("DOWN");
  if(keysDown[87])
    player2.move("UP");
  if(keysDown[83])
    player2.move("DOWN");
    
  player1.check_bounds();
  player2.check_bounds();
    
  
  
  // drawing section
  
  fill(255); 
  rect(0, 0, width, boundary_h); // draw boundaries
  rect(0, height - boundary_h, width, boundary_h);
  
  fill(128);
  for(int i = boundary_h; i < height - boundary_h; i += 60) {
    rect(width / 2 - 5, i, 10, 40); // draw center line
  }
  
  fill(255); 
  player1.draw(); // draw players
  player2.draw();
  
  rect(ball.x, ball.y, ball_size, ball_size); // draw ball

  
}
