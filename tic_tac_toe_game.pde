
Cell[][] grid; // Our game grid

static final int COLS = 3; // The number of colums
static final int ROWS = 3; // The number of rows

int player; // Variable to control witch player are playing

void setup() {
  size(400, 400); 
  smooth();

  grid = new Cell[COLS][ROWS]; // create our bidimensional array of Cells

  int xscale = width/3; // set the scale to better locate the Cells in grid
  int yscale = height/3; //  the same

  // create the cells
  for (int i = 0; i < COLS; i++) {
    for (int j = 0; j < ROWS; j++) {
      grid[i][j] = new Cell(5 + i * xscale, 5 + j * yscale, 
        xscale - 10, yscale - 10);
    }
  }
}

void draw() {
  background(255);
  
  // check if somebody won
  checkVictory();
  
  // display the game
  for (Cell[] row : grid) {
    for (Cell c : row) {
      c.display();
    }
  }
}

void checkVictory() {
  /* That's a bit confusion part that i'm working on. But the thing is: 
  The X's value is 9 and the O's value is 7. I choose these values because 
  they * 3 are only divided by 1, 3 or themselves; So... if i check the sum
  of a row and its more than 20 it has 3 markers (X or O) on that, and them
  i need to check if the markers are the same. And i do that checking they
  modulus by 3. If it's 0 and the sum of the row (or the colum, or the diagonal)
  is 21 (O victory) or 27 (X victory)
   I don't know if it's the best way, but it's the only one i found, so let
  me know if you have a better idea.
  */
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
}

void mousePressed() {

  for (Cell[] row : grid) {
    for (Cell c : row) {
      c.clicked(mouseX, mouseY, player%2);
    }
  }
  player++;
}
