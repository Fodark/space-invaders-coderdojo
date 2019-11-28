class Character {
  private int pos_x;
  private int pos_y;
  private int speed;
  private int len;
  private int wid;
  
  Character(int pos_x, int pos_y) {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
    this.speed = 5;
    this.wid = 60;
    this.len = 8;
  }
  
  void paint() {
    rect(this.pos_x, this.pos_y, wid, len);
  }
  
  void move(boolean right) {
    pos_x += right ? speed : -speed;
  }
  
  int getX() {
    return pos_x;
  }
  
  int getY() {
    return pos_y;
  }
}
