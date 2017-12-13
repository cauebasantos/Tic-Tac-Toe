Cell[][] grid;

static final int COLS = 3;
static final int ROWS = 3;

int player;

void setup() {
  size(400, 400); 
  smooth();

  grid = new Cell[COLS][ROWS];

  int xscale = width/3;
  int yscale = height/3;

  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      grid[i][j] = new Cell(5 + i * xscale, 5 + j * yscale, 
        xscale - 10, yscale - 10);
    }
  }
}

void draw() {
  background(255);

  for (int i = 0; i < COLS; i++) {
    int sumcol = 0;
    int sumrow = 0;
    for (int j = 0; j < ROWS; j++) {
      sumcol += grid[i][j].state;
      sumrow += grid[j][i].state;
    }
    if ((sumcol > 20 && sumcol % 3 == 0) || (sumrow > 20 && sumrow % 3 == 0)) {
      if (sumcol/3 == 7 || sumrow/3 == 7) {
        background(155, 0, 0, 100);
        noLoop();
      } else if (sumcol/3 == 9 || sumrow/3 == 9) {
        background(0, 0, 155, 100);
        noLoop();
      }
    }
  }

  int sumdg1 = grid[0][0].state + grid[1][1].state + grid[2][2].state;
  int sumdg2 = grid[2][0].state + grid[1][1].state + grid[0][2].state;
  if ((sumdg1 > 20 && sumdg1 % 3 == 0) || (sumdg2 > 20 && sumdg2 % 3 == 0)) {
    if (sumdg1 / 3 == 7 || sumdg2 / 3 == 7) {
      background(155, 0, 0, 100);
      noLoop();
    } else if (sumdg1 / 3 == 9 || sumdg2 / 3 == 9) {
      background(0, 0, 155, 100);
      noLoop();
    }
  }

  for (Cell[] row : grid) {
    for (Cell c : row) {
      c.display();
    }
  }
}

void mousePressed() {

  for (Cell[] row : grid) {
    for (Cell c : row) {
      c.clicked(mouseX, mouseY, player%2);
    }
  }
  player++;
}