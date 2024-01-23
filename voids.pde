void keyPressed() {
  check(key + "");
}

void check(String c) {
  //checks if word has the letter pressed in it
  if (word.contains(c)) {
    int index = word.indexOf(c);
    if (index >= 0)
      // to check if guess and answer are same
      guess = guess.substring(0, index) + c + guess.substring(index+1, word.length());
  } else {
    if (! wrongGuess.contains(c)) {
      //checks if the letter has been pressed before
      wrongGuess += c;
      wrong--;
    } else {
      println("This letter has been pressed");
    }
  }
}
void drawbuttons(float x, float y, String label, color buttonColor) {
  // Check if the mouse is over the button
  boolean overButton = mouseX > x - buttonWidth / 2 && mouseX < x + buttonWidth / 2 &&
    mouseY > y - buttonHeight / 2 && mouseY < y + buttonHeight / 2;

  // Change button color based on mouse over
  fill(overButton ? darkenColor(buttonColor) : buttonColor);
  rect(x, y, buttonWidth, buttonHeight, 10);

  // Display button label
  fill(0);
  textSize(20);
  text(label, x+(buttonWidth/4), y+(buttonHeight/2));
}

color darkenColor(color c) {
  float[] rgb = {red(c), green(c), blue(c)};
  for (int i = 0; i < rgb.length; i++) {
    rgb[i] = 0.7; // Darken the color by 30%
  }
  return color(rgb[0], rgb[1], rgb[2]);
}
void mousePressed() {
  println(gamescreen, mouseX, mouseY);
  if (gamescreen == 1) {
    if (mouseX>300 && mouseX<499 && mouseY> 400 && mouseY<450) {
      gamescreen = 2;
      println("button 1 clicked");
    }
    if (mouseX>300 && mouseX< 500 && mouseY>500 && mouseY<550) {
      gamescreen = 3;
      println("Button 2 clicked");
    }
    if (mouseX>300 && mouseX< 499 && mouseY> 600 && mouseY<650) {
      gamescreen = 4;
      println("button 3 clicked");
    }
  }
  if (gamescreen == 2) {
    if ((screens == -1) ||(screens == 2) || (screens == 3)) {
      if (mouseX > 100 && mouseX < 250 && mouseY > 550 && mouseY < 700) {
        //returns to the instruction screens
        screens = -1;
        wordqwerty = floor(random(words.length));
        word = words[wordqwerty];
        guess = "_______";
        wrongGuess = "";
        wrong = 7;
      }
      if (mouseX > 400 && mouseX < 550 && mouseY > 550 && mouseY < 700) {
        gamescreen = 1;
        size(900, 800);
  gamescreen = 1;
  background(255);
  noStroke();
  //choose random word from list
  wordqwerty = floor(random(words.length));
  word = words[wordqwerty];
  niallhoran = loadImage("niallhoran.png");
  music = loadImage("music.png");
  backgroundImage = loadImage("background.jpg");
  ballImage = loadImage("ball.png");
  rectMode(CORNER);
      }
    }
    if (screens == -1) {
      if (mouseX > 100 && mouseX < 250 && mouseY > 550 && mouseY < 700) {
        //returns to the instruction screens
        screens = 1;
        wordqwerty = floor(random(words.length));
        word = words[wordqwerty];
        guess = "_______";
        wrongGuess = "";
        wrong = 7;
      }
    }
  }
  if (gamescreen == 3) {
    if (mouseX > 400 && mouseX < 550 && mouseY > 550 && mouseY < 700) {
        gamescreen = 1;
      }
    println("opening pong game", gameStart);
    if (gameStart) {
      // Game is running
      game();
    }

    if (!gameStart) {
      startScreen();
      // Check difficulty selection when the game is not started
      if (mouseY > height / 2 && mouseY < height / 2 + 40) {
        if (mouseX > width / 4 - 50 && mouseX < width / 4 + 50) {
          difficulty = 1;  // Easy
        } else if (mouseX > width / 2 - 50 && mouseX < width / 2 + 50) {
          difficulty = 2;  // Medium
        } else if (mouseX > 3 * width / 4 - 50 && mouseX < 3 * width / 4 + 50) {
          difficulty = 3;  // Hard
        }
        println(difficulty, gamescreen);
        startGame();
      }
      if (mouseX > 400 && mouseX < 470 && mouseY > 500 && mouseY < 510) {
        gamescreen = 1;
      }
    }
  }
}
void Button(int x, int y, String title) {
  if (mouseX > x && mouseX < x + 150 && mouseY > y && mouseY < y + 50) {
    fill(255, 0, 0);
  } else fill(0, 255, 0);
  rect(x, y, 150, 50);
  textSize(30);
  fill(0);
  text(title, x + 70 - textWidth(title)/2, y + 30);
}
void startScreen() {
  if (gamescreen == 3) {
    background(200);
    // Display start text
    fill(255);
    textSize(30);
    textAlign(CENTER, CENTER);
    text("Choose Difficulty", width / 2, height / 2 - 50);

    // Easy button
    fill(0, 255, 0); // Green
    rect(width / 4 - 50, height / 2, 100, 40);
    fill(0);
    textSize(20);
    text("Easy", width / 4, height / 2 + 20);

    // Medium button
    fill(255, 255, 0); // Yellow
    rect(width / 2 - 50, height / 2, 100, 40);
    fill(0);
    text("Medium", width / 2, height / 2 + 20);

    // Hard button
    fill(255, 0, 0); // Red
    rect(3 * width / 4 - 50, height / 2, 100, 40);
    fill(0);
    text("Hard", 3 * width / 4, height / 2 + 20);

    rectMode(CORNER);
    Button(400, 550, "Exit");
    //text("Exit Game",470,570);
  }
}
void game() {
  image(backgroundImage, 0, 0, width, height);

  fill(128, 128, 128);
  diam = 20;
  image(ballImage, x, y, diam, diam);


  fill(leftColor);
  rect(0, 0, 20, height);
  fill(rightColor);
  rect(width - 30, mouseY - rectSize / 2, 10, rectSize);

  fill(0);
  textSize(20);
  textAlign(RIGHT, TOP);  // Set text alignment to right, top
  text("Score: " + score, width - 10, 10);  // Display score in the right upper corner

  x = x + speedX;
  y = y + speedY;

  if (x > width - 30 && x < width - 20 && y > mouseY - rectSize / 2 && y < mouseY + rectSize / 2) {
    speedX = speedX * -1;
    x = x + speedX;
    rightColor = 0;
    fill(random(0, 128), random(0, 128), random(0, 128));
    diamHit = random(75, 150);
    ellipse(x, y, diamHit, diamHit);
    rectSize = rectSize - 10;
    rectSize = constrain(rectSize, 10, 150);
    score++; // Increase the score when the bar is hit
  } else if (x < 25) {
    speedX = speedX * -1.1;
    x = x + speedX;
    leftColor = 0;
  } else {
    leftColor = 128;
    rightColor = 128;
  }

  if (x > width) {
    gameStart = false;
    x = 150;
    y = 150;
    startScreen();  // After each round, display difficulty selection
  }

  if (y > height || y < 0) {
    speedY = speedY * -1;
    y = y + speedY;
  }
}
void startGame() {
  println("starting game");
  gameStart = true;
  setDifficultyParameters();
}
void setDifficultyParameters() {
  // Set speed parameters based on the difficulty level
  if (difficulty == 1) {
    speedX = random(3, 6);
    speedY = random(3, 6);
  } else if (difficulty == 2) {
    speedX = random(9, 15);
    speedY = random(9, 15);
  } else if (difficulty == 3) {
    speedX = random(18, 24);
    speedY = random(18, 24);
  }
}
