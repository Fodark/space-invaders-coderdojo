int n_aliens_per_row = 5;
int n_rows = 2;
int alien_size = 40;
int spacing = 8;
int c_width = 30;
int p_height = 30;

int score;
int number_aliens_alive;

PImage alien_img;

Alien aliens[] = new Alien[n_aliens_per_row * n_rows];
Projectile projectile;
Character c;

void check() {
  if(aliens[0].isMovingRight()) {
    if(aliens[n_aliens_per_row - 1].getX() >= width - alien_size) {
      for(Alien a : aliens) {
        a.downARow();
        a.setMoveRight(false);
      }
    }
  } else {
    if(aliens[0].getX() < 0) {
      for(Alien a : aliens) {
        a.downARow();
        a.setMoveRight(true);
      }
    }
  }
}

void checkWin() {
  if(number_aliens_alive == 0) {
    text("YOU WON", width / 2, height / 2);
  }
  
  for(Alien a : aliens) {
    if(a.isVisible()) {
      if(a.getY() >= height - alien_size) {
        text("YOU LOST", width / 2 - 50, height / 2);
      }
    }
  }
}

void checkProjectile() {
  for(Alien a : aliens) {
    if(a.isVisible()) {
      if(projectile.getX() >= a.getX() && projectile.getX() <= a.getX() + alien_size) {
        if(projectile.getY() >= a.getY() && projectile.getY() <= a.getY() + alien_size) {
          a.die();
          projectile.setVisible(false);
          score++;
          number_aliens_alive--;
        }
      } else if(projectile.getX() + projectile.getWidth() >= a.getX() && projectile.getX() + projectile.getWidth() <= a.getX() + alien_size) {
        if(projectile.getY() >= a.getY() && projectile.getY() <= a.getY() + alien_size) {
          a.die();
          projectile.setVisible(false);
          score++;
          number_aliens_alive--;
        }
      }
    }
  }
}

void setup() {
  size(480,640);
  background(0,0,0);
  fill(255, 255, 255);
  stroke(255, 255, 255);
  smooth();
  background(0);
  alien_img = loadImage("alien.png");
  score = 0;
  number_aliens_alive = n_aliens_per_row * n_rows;
  int y = 0;
  c = new Character(width/2, height - 8);
  for(int i = 0; i < n_rows; i++) {
    for(int j = 0; j < n_aliens_per_row; j++) {
      aliens[i*n_aliens_per_row + j] = new Alien((alien_size + spacing)*j, (alien_size + spacing)*i, alien_size);
    }
  }
}

void draw() {
  clear();
  fill(255,255,255);
  c.paint();
  for(Alien alien : aliens) {
    alien.paint(alien_img);
    alien.move();
    check();
  }
  
  if(projectile != null) {
    projectile.paint();
    projectile.move();
    checkProjectile();
    if(!projectile.isVisible()) {
      projectile = null;
    }
  }
  
  textSize(32);
  fill(255,0,0);
  text(score, 10, 30); 
  checkWin();
}

void keyPressed() {
  if (key == ' ') {
    if(projectile == null) {
      projectile = new Projectile(c.getX() + c_width / 2, c.getY() - p_height);
    }
  } else if(key == CODED) {
    if(keyCode == RIGHT) {
      c.move(true);
    } else if(keyCode == LEFT) {
      c.move(false);
    }
  }
}
