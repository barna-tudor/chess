
boolean negru=true;
void setup()
{
  size(900, 800);
  textSize(32);
  textAlign(LEFT, TOP);
  shapeMode(CORNER);
  loadShapes();
  setField();
  rectMode(CORNER);
}
void draw()
{
  background(0);
  for (int i=1; i<=8; i++)
  {
    
    negru=!negru;
    for (int j=1; j<=8; j++)
    {
      if (negru)
      {
        fill(#74693D);
      } else {
        fill(#E3CE76);
      }
      negru=!negru;
      rect((j-1)*100, (i-1)*100, 100, 100);
      if (Field[i][j].highlighted)
      {
        if (Field[i][j].colour*Field[tempI][tempJ].colour<0)
        {
          if (!negru)
          {
            fill(255, 0, 0, 60);
            stroke(234, 9, 9);
          } else
          {
            fill(127, 0, 0, 120);
            stroke(127, 0, 0);
          }
        } else
        {
          if (!negru)
          {
            fill(17, 242, 2, 40);
            stroke(17, 242, 2);
          } else {
            fill(18, 182, 4, 127);
            stroke(18, 182, 4);
          }
        }
        rect((j-1)*100+4, (i-1)*100+4, 92, 92);
        fill(0);
        stroke(0);
      }
      if (Field[i][j].colour==WHITE)
      {

        switch (Field[i][j].type)
        {
        case PAWN:
          shape(pawn_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case ROOK:
          shape(rook_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case KNIGHT:
          shape(knight_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case BISHOP:
          shape(bishop_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case QUEEN:
          shape(queen_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case KING:
          shape(king_white, (j-1)*100, (i-1)*100, 100, 100);
          break;
        }
      } else
      {
        switch (Field[i][j].type)
        {
        case PAWN:
          shape(pawn_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case ROOK:
          shape(rook_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case KNIGHT:
          shape(knight_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case BISHOP:
          shape(bishop_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case QUEEN:
          shape(queen_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        case KING:
          shape(king_black, (j-1)*100, (i-1)*100, 100, 100);
          break;
        }
      }
    }
  }
}
