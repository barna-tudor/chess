
boolean negru=true;
void setup()
{
  size(800, 800);
  textSize(32);
  textAlign(LEFT, TOP);
  shapeMode(CORNER);
  loadShapes();
  setField();
  rectMode(CORNER);
}
void draw()
{
  if (playing)
  {
    background(0);
    if (Field[1][1].colour!=BLACK)
    {
      blackLongRookMoved=true;
    }
    if (Field[1][8].colour!=BLACK)
    {
      blackShortRookMoved=true;
    }
    if (Field[8][1].colour!=WHITE)
    {
      whiteLongRookMoved=true;
    }
    if (Field[8][8].colour!=WHITE)
    {
      whiteShortRookMoved=true;
    }
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
  } else
  {
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
    fill(10, 10, 10, 127);
    rect(0, 0, 800, 800);
    fill(127, 127, 127, 200);
    rect(200-10, 300-10, 400+20, 100+20, 25);
    if (pawnColor==WHITE)
    {
      shape(rook_white, 200, 300, 100, 100);
      shape(knight_white, 300, 300, 100, 100);
      shape(bishop_white, 400, 300, 100, 100);
      shape(queen_white, 500, 300, 100, 100);
    } else
    {
      shape(rook_black, 200, 300, 100, 100);
      shape(knight_black, 300, 300, 100, 100);
      shape(bishop_black, 400, 300, 100, 100);
      shape(queen_black, 500, 300, 100, 100);
    }
  }
}
