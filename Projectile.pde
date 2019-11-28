class Projectile {
  private int pos_x;
  private int pos_y;
  private boolean visible;
  private int len;
  private int wid;
  private int speed;
  
  Projectile(int pos_x, int pos_y) {
    this.pos_x = pos_x;
    this.pos_y = pos_y;
    this.visible = true;
    this.len = 30;
    this.wid = 3;
    this.speed = 5;
  }
  
  void move() {
    this.pos_y -= speed;
    if(this.pos_y <= 0) this.visible = false;
  }
  
  void paint() {
    rect(this.pos_x, this.pos_y, wid, len);
  }
  
  int getX() {
    return pos_x;
  }
  
  int getY() {
    return pos_y;
  }
  
  int getWidth() {
    return wid;
  }
  
  int getHeight() {
    return len;
  }
  
  boolean isVisible() {
    return visible;
  }
  
  void setVisible(boolean visible) {
    this.visible = visible;
  }
}
