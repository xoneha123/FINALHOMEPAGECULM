int buttonWidth = 200;
int buttonHeight = 60;
String[] words = {"country", "picture", "careful", "english", "improve", "walking", "stomach", "climate", "problem",
  "harmful", "rainbow", "kitchen", "parking", "journey", "friends", "quickly", "dialect", "rafting", "magnets", "objects", "panther"};
//array of possible words
int wrong = 7;
PImage niallhoran;
PImage music;
String letter;
int wordqwerty;
String word;
String guess = "_______";
String wrongGuess = "";
int screens = -1;
int hangpoint = 0;
int gamescreen;
boolean gameStart = false;
int score = 0;

float x = 150;
float y = 150;
float speedX;
float speedY;
int leftColor = 128;
int rightColor = 128;
int diam;
int rectSize = 150;
float diamHit;
int difficulty = 0;  // 0: No difficulty chosen, 1: Easy, 2: Medium, 3: Hard
PImage ballImage;
PImage backgroundImage;


void setup() {
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

void draw() {
  if (gamescreen == 1) {
    //rectMode(CORNER);
    // Display title
    background(255);
    fill(0);
    textSize(40);
   // text("Welcome to One Direction fanpage club", width/5, 120);
    drawbuttons(200,200, "Welcome to One Direction fanpage club", color(255,255,255));

    // Draw buttons
    drawbuttons(width / 3, height / 2, "Hangman", color(255, 100, 100));
    drawbuttons(width / 3, height / 2 + 100, "Pong", color(100, 255, 100));
  //  drawbuttons(width / 3, height / 2 + 200, "Escape Room"+20, color(100, 100, 255));

   
  }
  if (gamescreen == 2) {
    //shows the rules of the game
    background(0);
    if (screens == -1) {
      background(0);
      textSize(60);
      fill(255);
      rectMode(CORNER);
      text("Rules:", 100, 100);
      textSize(35);
      text("-Try to guess the word by pressing letters", 140, 200);
      text("  on your keyboard, the blanks will give", 140, 235);
      text("  you hints for where the letters are", 140, 270);
      text("-Guess the word before the number of", 140, 330);
      text("  wrong guesses run out", 140, 365);
      text("-Save Niall Horan", 140, 425);
      Button(100, 550, "Play");
      image(niallhoran, 400, 400, 100, 100);
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
      Button(400, 550, "Exit game");
    }
    if (screens == 1) {
      rectMode(CORNER);
      background(0);
      //text(word, 100, 450);
      //pole thing that the person hangs on
      fill(255);
      rect(250, 50, 10, 25);
      rect(150, 50, 10, 250);
      rect(50, 300, 210, 10);
      rect(150, 50, 100, 10);
      fill(255);
      textSize(50);
      strokeWeight(2);
      //shows the letters in the word as you guess letters
      text(guess, 100, 550);
      text(wrongGuess, 100, 650);
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
      image(music, 400, 400, 250, 200);
      if (wrong>0) {
        textSize(35);
        //makes the parts of the body show as you get more and more wrong guesses
        text("Wrong Guesses Left :"+wrong, 350, 200);
        if (wrong == 6) {
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 5) {
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 4) {
          rect(265, 150, 25, 10);//arm1
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 3) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 2) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(250, 190, 20, 10);//pelvis
          rect(245, 190, 10, 60);//leg2
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        } else if (wrong == 1) {
          rect(265, 150, 25, 10);//arm1
          rect(230, 150, 25, 10);//arm2
          rect(250, 190, 20, 10);//pelvis
          rect(245, 190, 10, 60);//leg2
          rect(265, 190, 10, 60);//leg1
          rect(255, 130, 10, 60);//body
          image(niallhoran, 220, 70, 70, 70); //head
        }
      }
      //if the guess is the same as the word, it will show that you won
      if (guess.equals(word)) {
        screens = 2;
        hangpoint = hangpoint+1;
      }
      //when there are no wrong guesses left, it will show that you lost
      if (wrong == 0) {
        screens = 3;
      }
    }
    if (screens == 2) {
      //win screens
      background(0);
      fill(255);
      textSize(50);
      strokeWeight(2);
      text("You Win!!", 200, 200);
      text("Good Job!!", 200, 300);
      //goes back to home screens
      Button(100, 550, "Home");
      Button(400, 550, "Exit game");
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
    } else if (screens == 3) {
      // lose screens
      background(0);
      fill(255);
      textSize(50);
      strokeWeight(2);
      text("You Lost", 200, 200);
      text("Better Luck Next Time", 150, 300);
      text("The word was: "+word, 150, 400);
      //goes back to home screens
      Button(100, 550, "Try Again");
      Button(400, 550, "Exit game");
      textSize(20);
      fill(255);
      text("Points: "+hangpoint, 590, 40);
    }
  }
  if (gamescreen == 3) {
    if (gameStart) {
      // Game is running
      game();
    }
  }
   textSize(20);
    fill(0);
    text(mouseX + "," +mouseY, 500, 50);
}
