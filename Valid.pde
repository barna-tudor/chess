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
  int m=1;
  while (i+m<=8)
  {
    if (Field[i+m][j].type==FREE)
    {
      Field[i+m][j].highlighted=true;
    } else
    {
      if (Field[i+m][j].colour*Field[i][j].colour<0&&Field[i+m][j].type!=KING)
      {
        Field[i+m][j].highlighted=true;
        break;
      } else break;
    }
    m++;
  }
  m=-1;
  while (i+m>=1)
  {
    if (Field[i+m][j].type==FREE)
    {
      Field[i+m][j].highlighted=true;
    } else
    {
      if (Field[i+m][j].colour*Field[i][j].colour<0&&Field[i+m][j].type!=KING)
      {
        Field[i+m][j].highlighted=true;
        break;
      } else break;
    }
    m--;
  }
  m=1;
  while (j+m<=8)
  {
    if (Field[i][j+m].type==FREE)
    {
      Field[i][j+m].highlighted=true;
    } else
    {
      if (Field[i][j+m].colour*Field[i][j].colour<0&&Field[i][j+m].type!=KING)
      {
        Field[i][j+m].highlighted=true;
        break;
      } else break;
    }
    m++;
  }
  m=-1;
  while (j+m>=1)
  {
    if (Field[i][j+m].type==FREE)
    {
      Field[i][j+m].highlighted=true;
    } else
    {
      if (Field[i][j+m].colour*Field[i][j].colour<0&&Field[i][j+m].type!=KING)
      {
        Field[i][j+m].highlighted=true;
        break;
      } else break;
    }
    m--;
  }
}
void knightValid(int i, int j )
{
  for (int m=0; m<8; m++)
  {
    int y=i+di[m];
    int x=j+dj[m];
    if (y >= 1 && y <= 8 && x >= 1 && x <= 8)
    {
      if (Field[y][x].colour!=Field[i][j].colour&&Field[y][x].type!=KING)
      {
        Field[y][x].highlighted=true;
      }
    }
  }
}
void queenValid(int i, int j )
{
  bishopValid(i, j);
  rookValid(i, j);
}
void bishopValid(int i, int j )
{
  int m=1, n=1;
  while (i+m<=8&&j+n<=8)
  {
    if (Field[i][j].colour*Field[i+m][j+n].colour>0)
    {
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour<0&& Field[i+m][j+n].type!=KING)
    {
      Field[i+m][j+n].highlighted=true;
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour==0)
    {
      Field[i+m][j+n].highlighted=true;
    }
    m++;
    n++;
  }
  m=1;
  n=-1;
  while (i+m<=8&&j+n>=1)
  {
    if (Field[i][j].colour*Field[i+m][j+n].colour>0)
    {
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour<0&& Field[i+m][j+n].type!=KING)
    {
      Field[i+m][j+n].highlighted=true;
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour==0)
    {
      Field[i+m][j+n].highlighted=true;
    }
    m++;
    n--;
  }
  m=-1;
  n=-1;
  while (i+m>=1&&j+n>=1)
  {
    if (Field[i][j].colour*Field[i+m][j+n].colour>0)
    {
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour<0 && Field[i+m][j+n].type!=KING)
    {
      Field[i+m][j+n].highlighted=true;
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour==0)
    {
      Field[i+m][j+n].highlighted=true;
    }
    m--;
    n--;
  }
  m=-1;
  n=1;
  while (i+m>=1&&j+n<=8)
  {
    if (Field[i][j].colour*Field[i+m][j+n].colour>0)
    {
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour<0 && Field[i+m][j+n].type!=KING)
    {
      Field[i+m][j+n].highlighted=true;
      break;
    }
    if (Field[i][j].colour*Field[i+m][j+n].colour==0)
    {
      Field[i+m][j+n].highlighted=true;
    }
    m--;
    n++;
  }
}
void kingValid(int i, int j )
{
  if (i>1)
  {
    if (Field[i-1][j].type==FREE||Field[i-1][j].colour*Field[i][j].colour<0)
    {
      Field[i-1][j].highlighted=true;
    }
  }
  if (j>1)
  {
    if (Field[i][j-1].type==FREE||Field[i][j-1].colour*Field[i][j].colour<0)
    {
      Field[i][j-1].highlighted=true;
    }
  }
  if (i>1&&j>1)
  {
    if (Field[i-1][j-1].type==FREE||Field[i-1][j-1].colour*Field[i][j].colour<0)
    {
      Field[i-1][j-1].highlighted=true;
    }
  }
  if (i<8)
  {
    if (Field[i+1][j].type==FREE||Field[i+1][j].colour*Field[i][j].colour<0)
    {
      Field[i+1][j].highlighted=true;
    }
  }
  if (j<8)
  {
    if (Field[i][j+1].type==FREE||Field[i][j+1].colour*Field[i][j].colour<0)
    {
      Field[i][j+1].highlighted=true;
    }
  }
  if (i<8&&i<8)
  {
    if (Field[i+1][j+1].type==FREE||Field[i+1][j+1].colour*Field[i][j].colour<0)
    {
      Field[i+1][j+1].highlighted=true;
    }
  }
  if (i>1&&j<8)
  {
    if (Field[i-1][j+1].type==FREE||Field[i-1][j+1].colour*Field[i][j].colour<0)
    {
      Field[i-1][j+1].highlighted=true;
    }
  }
  if (j>1&&i<8)
  {
    if (Field[i+1][j-1].type==FREE||Field[i+1][j-1].colour*Field[i][j].colour<0)
    {
      Field[i+1][j-1].highlighted=true;
    }
  }
  if (Field[i][j].colour==WHITE)
  {
    if (!whiteKingMoved)
    {
      if (!whiteShortRookMoved)
      {
        if (Field[i][j+1].type==FREE&&Field[i][j+2].type==FREE)
        {
          Field[i][j+2].highlighted=true;
        }
      }
      if (!whiteLongRookMoved)
      {
        if (Field[i][j-1].type==FREE&&Field[i][j-2].type==FREE&&Field[i][j-3].type==FREE)
        {
          Field[i][j-3].highlighted=true;
        }
      }
    }
  } else
  {
    if (!blackKingMoved)
    {
      if (!blackShortRookMoved)
      {
        if (Field[i][j+1].type==FREE&&Field[i][j+2].type==FREE)
        {
          Field[i][j+2].highlighted=true;
        }
      }
      if (!blackLongRookMoved)
      {
        if (Field[i][j-1].type==FREE&&Field[i][j-2].type==FREE&&Field[i][j-3].type==FREE)
        {
          Field[i][j-3].highlighted=true;
        }
      }
    }
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
