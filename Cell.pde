class Cell {

  float x, y;
  float w, h;

  int state;
  int N = 0;
  int O = 7;
  int X = 9;

  color bgColor = color(51);
  color xoColor = color(255); 

  Cell(float x, float y, float w, float h) {
    this.x = x;
    this.y = y;
    this.w = w;
    this.h = h;
    this.state = N;
  }

  void clicked(float mx, float my, int player) {
    if (!(mx < x || mx > x + w || my < y || my > y + h) && state == N) {
      if (player == 0) {
        this.state = X;
      } else {
        this.state = O;
      }
    }
  }

  void display() {
    //rectMode(CENTER);
    noStroke();
    fill(bgColor);
    rect(x, y, w, h);

    if (state == O) {
      ellipseMode(CENTER);
      noStroke();
      fill(xoColor);
      ellipse(x + w/2, y + h/2, w * 2/3, h * 2/3);
      fill(bgColor);
      ellipse(x + w/2, y + h/2, w * 1/3, h * 1/3);
    } else if (state == X) {
      stroke(xoColor);
      strokeWeight(20);
      line(x + w * 1/4, y + h * 1/4, (x + w) - w * 1/4, (y + h) - h * 1/4);
      line(x + w * 1/4, (y + h) - h * 1/4, (x + w) - w * 1/4, y + h * 1/4);
    }
  }
}