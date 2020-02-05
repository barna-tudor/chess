void pawnValid(int i, int j )
{

  if (Field[i][j].colour==WHITE)
  {
    if (j>1&&i>1)
    {
      if (Field[i-1][j-1].colour==BLACK&&Field[i-1][j-1].type!=KING)
        Field[i-1][j-1].highlighted=true;
    }
    if (j<8&&i>1)
    {
      if (Field[i-1][j+1].colour==BLACK&&Field[i-1][j+1].type!=KING)
        Field[i-1][j+1].highlighted=true;
    }
    if (i==7)
    {
      if (Field[i-1][j].type==FREE)
      {
        Field[i-1][j].highlighted=true;
        if (Field[i-2][j].type==FREE)
          Field[i-2][j].highlighted=true;
      }
    } else
    {  
      if (i>1)
        if (Field[i-1][j].type==FREE)
        {
          Field[i-1][j].highlighted=true;
        }
    }
  } else
  {
    if (j<8&&i<8)
    {
      if (Field[i+1][j+1].colour==WHITE&&Field[i+1][j+1].type!=KING)
        Field[i+1][j+1].highlighted=true;
    }
    if (i<8&&j>1)
    {
      if (Field[i+1][j-1].colour==WHITE&&Field[i+1][j-1].type!=KING)
        Field[i+1][j-1].highlighted=true;
    }
    if (i==2)
    {
      if (Field[i+1][j].type==FREE)
      {
        Field[i+1][j].highlighted=true;
        if (Field[i+2][j].type==FREE)
          Field[i+2][j].highlighted=true;
      }
    } else
    {  
      if (i<8)
        if (Field[i+1][j].type==FREE)
        {
          Field[i+1][j].highlighted=true;
        }
    }
  }
}
void rookValid(int i, int j )
{
  if (Field[i][j].colour==WHITE)
  {
  } else
  {
  }
}
void knightValid(int i, int j )
{
  
}
void queenValid(int i, int j )
{
  if (Field[i][j].colour==WHITE)
  {
  } else
  {
  }
}
void bishopValid(int i, int j )
{
  if (Field[i][j].colour==WHITE)
  {
  } else
  {
  }
}
void kingValid(int i, int j )
{
  if (Field[i][j].colour==WHITE)
  {
  } else
  {
  }
}
void valid(int i, int j)
{
  Field[i][j].highlighted=true;
  switch(Field[i][j].type)
  {
  case PAWN:
    pawnValid(i, j);
    break;
  case ROOK:
    rookValid(i, j);
    break;
  case KNIGHT:
    knightValid(i, j);
    break;
  case BISHOP:
    bishopValid(i, j);
    break;
  case QUEEN:
    queenValid(i, j);
    break;
  case KING:
    kingValid(i, j);
    break;
  }
}
