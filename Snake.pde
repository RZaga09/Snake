int snake_x[] = {300, 280};
int snake_y[] = {300, 300};
int direction, apple_x, apple_y;
boolean die = true;

void setup() {
  size(600, 600);
  direction = 0;
  frameRate(7);
  while (1 == 1) {
    apple_x = (int) random(0, 580);
    apple_y = (int) random(0, 580);
    apple_x = apple_x - (apple_x % 20);
    apple_y = apple_y - (apple_y % 20);
    if (apple_x != 300 && apple_y != 300) {
      break;
    }
  }
}

void draw() {
  background(0);
  if (die) {
    init();
    fill(255);
    textAlign(CENTER);
    textSize(64);
    text("SNAKE", 300, 300);
    if (keyPressed) {
     if (key == ENTER) {
       die = false;
     }
    }
  } else {
    move();
    apple();
    snake();
    die();
  }
}

void snake() {
  fill(0, 255, 0);
  rect(snake_x[0], snake_y[0], 20, 20);
  for (int i = 1; i < snake_x.length; i++) {
    fill(255);
    rect(snake_x[i], snake_y[i], 20, 20);
  }
}

void apple() {
  if (snake_x[0] == apple_x && snake_y[0] == apple_y) {
    snake_x = expand(snake_x, snake_x.length + 1);
    snake_y = expand(snake_y, snake_y.length + 1);
    snake_x[snake_x.length - 1] = snake_x[snake_x.length - 2];
    snake_y[snake_y.length - 1] = snake_y[snake_y.length - 2];

    if (direction == 0) {
      snake_x[snake_x.length - 1] -= 20;
    } else if (direction == 1) {
      snake_x[snake_x.length - 1] += 20;
    } else if (direction == 2) {
      snake_y[snake_y.length - 1] += 20;
    } else if (direction == 3) {
      snake_y[snake_y.length - 1] -= 20;
    }

    while (1 == 1) {
      boolean good = true;
      apple_x = (int) random(0, 580);
      apple_y = (int) random(0, 580);
      apple_x = apple_x - (apple_x % 20);
      apple_y = apple_y - (apple_y % 20);
      for (int i = 0; i < snake_x.length; i++) {
        if (apple_x == snake_x[i] || apple_y == snake_y[i]) {
          good = false;
          break;
        }
      } 
      if (good) {
        break;
      }
    }
  } 
  fill(255, 0, 0);
  rect(apple_x, apple_y, 20, 20);
}

void move() {
  for (int i = snake_x.length - 1; i > 0; i--) {
    snake_x[i] = snake_x[i-1];
    snake_y[i] = snake_y[i-1];
  }

  if (direction == 0) {
    snake_x[0] += 20;
  } else if (direction == 1) {
    snake_x[0] -= 20;
  } else if (direction == 2) {
    snake_y[0] -= 20;
  } else if (direction == 3) {
    snake_y[0] += 20;
  }
}

void die() {
  if (snake_x[0] < 0 || snake_x[0] > 580 || snake_y[0] < 0 || snake_y[0] > 580) {
    die = true;
  }

  for (int i = 1; i < snake_x.length; i++) {
    if (snake_x[0] == snake_x[i] && snake_y[0] == snake_y[i]) {
      die = true;
    }
  }
}

void keyPressed() {
  if (keyCode == RIGHT) {
    if (direction != 1) {
      direction = 0;
    }
  } else if (keyCode == LEFT) {
    if (direction != 0) {
      direction = 1;
    }
  } else if (keyCode == UP) {
    if (direction != 3) {
      direction = 2;
    }
  } else if (keyCode == DOWN) {
    if (direction != 2) {
      direction = 3;
    }
  }
}

void init() {
  snake_x = expand(snake_x, 2);
  snake_y = expand(snake_y, 2);
  snake_x[0] = 300;
  snake_x[1] = 280;
  snake_y[0] = 300;
  snake_y[1] = 300;
}
