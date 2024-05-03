PVector player1, player2;
int player_w = 20, player_h = 100, boundary_h = 20;

void setup() {
  size(1200, 800);
  frameRate(60);
  
  player1 = new PVector(width - player_w, height / 2 - player_h / 2);
  player2 = new PVector(0, height / 2 - player_h / 2);
}

void draw() {
  
  background(0);
  noStroke();
  
  fill(255); // drawing section
  
  rect(player1.x, player1.y, 20, 100); // draw players
  rect(player2.x, player2.y, 20, 100);
  
  rect(0, 0, width, boundary_h); // draw boundaries
  rect(0, height - boundary_h, width, boundary_h);
  
  fill(128);
  for(int i = boundary_h; i < height - boundary_h; i += 60) {
    rect(width / 2 - 5, i, 10, 40); // draw center line
  }

  
}
