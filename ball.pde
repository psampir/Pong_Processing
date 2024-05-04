class Ball {
   int direction;
   final float eff_vel = 11;
   final float adjust = 5.5;
   PVector position, velocity;
   final int size = 20;
   
   Ball() {
     direction = int(random(0, 4)); // randomize where to pass the ball
     reset();
   }
   
   void move() {
     position.add(velocity); 
   }
   
   void checkCollision() { 
     if(position.y < bound_h) { // collision with top bound
       position.y = bound_h;
       velocity.y *= -1;
     }
     
     else if(position.y > height - size - bound_h) { // collision with bottom bound
       position.y = height - size - bound_h;  
       velocity.y *= -1;
     }
     
     if(position.x <= player2.w && position.y + size > player2.position.y && position.y < player2.position.y + player2.h) {
       rebound(player2); // collision with player2
     }
     else if (position.x >= width - size - player1.w && position.y + size > player1.position.y && position.y < player1.position.y + player1.h) {
       rebound(player1); // collision with player1
     }
   }
   
   void rebound(Player player) {
     float ball_cent_h = position.y + size / 2;
     float player_cent_h = player.position.y + player.h / 2; 
     float distance = ball_cent_h - player_cent_h; // calculate the distance between the center of the player and the center of the ball
     
     velocity.y = distance / adjust; // make vertical velocity dependent on this distance
       
     if(velocity.y < 3 && velocity.y > -3) {
       velocity.y = random(-3, 3); // randomize smaller values for fun :)
     }
       
     if(velocity.x == -3 || velocity.x == 3) 
       velocity.x *= 3; // speed up the ball after rebounding with a player
     
     velocity.x *= -1; // rebound the ball horizontally
      
     if(velocity.x < 0)
       velocity.x = -1 * calcHorizontalVelocity(velocity.y, eff_vel); // calculate horizontal velocity based on vertical and effective velocities
     else
       velocity.x = calcHorizontalVelocity(velocity.y, eff_vel);
     
     print("vel X: " + velocity.x + "\n");
     print("vel Y: " + velocity.y + "\n\n");
   }
   
   float calcHorizontalVelocity(float vert_vel, float eff_vel) { 
     float hor_vel_sqr = pow(eff_vel, 2) - pow(vert_vel, 2);
     return sqrt(hor_vel_sqr);
   }
  
   void checkScore() {
     if(position.x < 0) {
       player1.score ++;
       direction = int(random(2, 4));
       reset();
     }
     else if(position.x > width - size) {
       player2.score ++;
       direction = int(random(0, 2));
       reset();
     }
   }
   
   void reset() {
     position = new PVector(width / 2 - size / 2, height / 2 - size / 2);
     
     if(direction == 0)
       velocity = new PVector(3, 3);
     else if(direction == 1)
       velocity = new PVector(3, -3);
     else if(direction == 2)
       velocity = new PVector(-3, 3);
     else
       velocity = new PVector(-3, -3);
   }
   
   void draw() {
     rect(position.x, position.y, size, size);
     //print("Ball pos: " + position.x + ", " + position.y + "; d = " + direction + "\n");
   }
}
