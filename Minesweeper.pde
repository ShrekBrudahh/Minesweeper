import de.bezier.guido.*;
private int NUM_COLS = 10;
private int NUM_ROWS = 10;
private MSButton[][] buttons; //2d array of minesweeper buttons
private ArrayList <MSButton> mines = new ArrayList<MSButton>(); //ArrayList of just the minesweeper buttons that are mined

void setup ()
{
    size(400, 400);
    textAlign(CENTER,CENTER);

    // make the manager
    Interactive.make( this );

    //your code to initialize buttons goes here
    buttons = new MSButton[NUM_ROWS][NUM_COLS];
    for (int r = 0; r < NUM_ROWS; r++)
      for (int c = 0; c < NUM_COLS; c++)
        buttons[r][c] = new MSButton(r,c);

    setMines();
}
public void setMines()
{
    int colR = (int)(Math.random() * NUM_COLS);
    int rowR = (int)(Math.random() * NUM_ROWS);
    if (!mines.contains(buttons[rowR][colR]))
      mines.add(buttons[rowR][colR]);
}

public void draw ()
    if(isWon() == true)
        displayWinningMessage();
}
public boolean isWon(){
    boolean allPressed = false;
    for (int r = 0; r < NUM_ROWS; r++){
        for (int c = 0; c < NUM_COLS; c++){
            if (!mines.contains(buttons[r][c])){
                if (buttons[r][c].clickedCkecker() == true){
                    allPressed = true;
                }else{
                    allPressed = false;
                }
            }
        }
    }
    return allPressed;
}

public void displayLosingMessage(){
    for (int r = 0; r < NUM_ROWS; r++){
        for (int c = 0; c < NUM_COLS; c++){
            buttons[r][c].setLabel("Lost!");
            if (mines.contains(buttons[r][c])){
                buttons[r][c].Click();
            }
        }
    }
}
public void displayWinningMessage(){
    for (int r = 0; r < NUM_ROWS; r++){
        for (int c = 0; c < NUM_COLS; c++){
            buttons[r][c].setLabel("Won!");
        }
    }
}

public boolean isValid(int r, int c)
{
    if (r >= 0 && r < NUM_ROWS && c >= 0 && c < NUM_COLS)
      return true;
    return false;
}
public int countMines(int row, int col)
{
    int numMines = 0;
    if (isValid(row+1,col))
       if (mines.contains(buttons[row+1][col])) numMines++;
     if (isValid(row-1,col))
       if (mines.contains(buttons[row-1][col])) numMines++;
     if (isValid(row+1,col+1))
       if (mines.contains(buttons[row+1][col+1])) numMines++;
     if (isValid(row-1,col-1))
       if (mines.contains(buttons[row-1][col-1])) numMines++;
     if (isValid(row+1,col-1))
       if (mines.contains(buttons[row+1][col-1])) numMines++;
     if (isValid(row-1,col+1))
       if (mines.contains(buttons[row-1][col+1])) numMines++;
     if (isValid(row,col+1))
       if (mines.contains(buttons[row][col+1])) numMines++;
     if (isValid(row,col-1))
       if (mines.contains(buttons[row][col-1])) numMines++;
    return numMines;
}
public class MSButton
    private float x,y, width, height;
    private boolean clicked, flagged;
    private String myLabel;

    public MSButton ( int row, int col )
    {
        width = 400/NUM_COLS;
        height = 400/NUM_ROWS;
        myRow = row;
        myCol = col;
        x = myCol*width;
        y = myRow*height;
        myLabel = "";
    }

    // called by manager
    public void mousePressed ()
    {
        clicked = true;
        if (mouseButton == RIGHT){
          flagged = !flagged;
          if (flagged == false){
            clicked = false;
          }
        }
        if (mines.contains(buttons[myRow][myCol]))
           displayLosingMessage();
        else if (countMines(myRow,myCol) > 0)
           setLabel(countMines(myRow,myCol));
        else{
          int row = myRow;
          int col = myCol;
           if (isValid(row+1,col))
             if (!buttons[row+1][col].clickedChecker()) buttons[row+1][col].mousePressed();
           if (isValid(row-1,col))
             if (!buttons[row-1][col].clickedChecker()) buttons[row-1][col].mousePressed();
           if (isValid(row+1,col+1))
             if (!buttons[row+1][col+1].clickedChecker()) buttons[row+1][col+1].mousePressed();
           if (isValid(row-1,col-1))
             if (!buttons[row-1][col-1].clickedChecker()) buttons[row-1][col-1].mousePressed();
           if (isValid(row+1,col-1))
             if (!buttons[row+1][col-1].clickedChecker()) buttons[row+1][col-1].mousePressed();
           if (isValid(row-1,col+1))
             if (!buttons[row-1][col+1].clickedChecker()) buttons[row-1][col+1].mousePressed();
           if (isValid(row,col+1))
             if (!buttons[row][col+1].clickedChecker()) buttons[row][col+1].mousePressed();
           if (isValid(row,col-1))
             if (!buttons[row][col-1].clickedChecker()) buttons[row][col-1].mousePressed();
        }
    }
    public void draw ()
    {    
        if (flagged)
            fill(0);
        else if( clicked && mines.contains(this) )
             fill(255,0,0);
        else if(clicked)
            fill( 200 );
        else
            fill( 100 );

        rect(x, y, width, height);
    {
        return flagged;
    }
    public boolean clickedChecker(){
       return clicked;
    }
    public void Click(boolean n){
        clicked = n;
    }
}
