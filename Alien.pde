class Alien {
  private int pos_x;
  private int pos_y;
  private boolean alive;
  private boolean move_right;
  private int speed;
  private int size;
  private int padding = 8;
  
  Alien(int pos_x, int pos_y, int size) {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
    this.alive = true;
    this.move_right = true;
    this.speed = 1;
    this.size = size;
  }
  
  int getX() {
    return this.pos_x;
  }
  
  int getY() {
    return this.pos_y;
  }
  
  void downARow() {
    this.pos_y += (this.size + this.padding);
  }
  
  void setMoveRight(boolean r) {
    this.move_right = r;
  }
  
  boolean isMovingRight() {
    return this.move_right;
  }
  
  boolean isVisible() {
    return this.alive;
  }
  
  void die() {
    this.alive = false;
  }
  
  void move() {
    if(this.move_right) {
      this.pos_x += speed;
    } else {
      this.pos_x -= speed;
    }
  }
  
  void paint(PImage img) {
    if(this.alive) {
      image(img,this.pos_x, this.pos_y, this.size, this.size);
      //rect(this.pos_x,this.pos_y,this.size,this.size);
    }
  }
}
