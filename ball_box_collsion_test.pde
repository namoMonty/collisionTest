float circleX, circleY;  // Position of the circle
float circleSpeedX = 2; // Horizontal speed of the circle
float circleSpeedY = 2; // Vertical speed of the circle

float squareX, squareY;  // Position of the square
float squareSize = 100; // Size of the square

void setup() {
  size(400, 400);
  circleX = width / 2;
  circleY = height / 2;
  squareX = random(width -  squareSize);
  squareY = random(height - squareSize);
}

void draw() {
  background(0);
  
  // Store the previous position of the circle
  float prevCircleX = circleX;
  float prevCircleY = circleY;
  
  // Update circle position
  circleX += circleSpeedX;
  circleY += circleSpeedY;
  
  // Check for collisions with the square
  if (circleX + 15 > squareX && circleX - 15 < squareX + squareSize) {
    if (circleY + 15 > squareY && circleY - 15 < squareY + squareSize) {
      // Bounce off the square
      circleSpeedX *= -1;
      circleSpeedY *= -1;
      
      // Move the circle back to its previous position 
      // this prevents ball from getting stuck inside
      // add 5 as buffer to create smoother transition
      circleX = prevCircleX+5;
      circleY = prevCircleY+5;
    }
  }
  
  // Handle square movement with keys (your existing code)
  if (keyPressed) {
    if (key == 'd') {
      squareX += 3.5;
    }
    else if (key == 'a' ) {
      squareX -= 3.5;
    }
    if (key == 's') {
      squareY += 3.5;
    }
    else if (key == 'w' ) {
      squareY -= 3.5;
    }
  }
  
  // Draw the circle
  ellipse(circleX, circleY, 30, 30);
  
  // Draw the square
  rect(squareX, squareY, squareSize, squareSize);
  
  
  
  
  
  // Keep the circle within the canvas
  if (circleX < 15 || circleX > width - 15) {
    circleSpeedX *= -1.01;
  }
  if (circleY < 15 || circleY > height - 15) {
    circleSpeedY *= -1.01;
  }
}
