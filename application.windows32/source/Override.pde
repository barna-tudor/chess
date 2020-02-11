boolean Selected=false;
boolean playing=true; 
int pawnColor, pawnJ;
Piece Temp=new Piece();
int tempI, tempJ;
void mousePressed()
{
  if (playing)
  {
    if (!Selected)
    {
      for (int i=1; i<=8; i++)
      {
        for (int j=1; j<=8; j++)
        {
          if (mouseX>(j-1)*100&&mouseX<(j)*100&&mouseY>(i-1)*100&&mouseY<(i)*100)
          {
            if (Field[i][j].type!=FREE)
            {
              valid(i, j);
              Temp.type=Field[i][j].type;
              Temp.colour=Field[i][j].colour;
              tempI=i;
              tempJ=j;
              Selected=!Selected;
            }
          }
        }
      }
    } else
    {
      for (int i=1; i<=8; i++)
      {
        for (int j=1; j<=8; j++)
        {
          if (mouseX>(j-1)*100&&mouseX<(j)*100&&mouseY>(i-1)*100&&mouseY<(i)*100)
          {
            if (Field[i][j].highlighted)
            {
              if (Field[tempI][tempJ].type==PAWN)
              {
                if (Field[tempI][tempJ].colour==WHITE)
                {
                  if (tempI==2&&i==1)
                  {
                    playing=false;
                    pawnJ=j;
                    pawnColor=Field[tempI][tempJ].colour;
                  }
                } else
                {
                  if (tempI==7&&i==8)
                  {
                    playing=false;
                    pawnJ=j;
                    pawnColor=Field[tempI][tempJ].colour;
                  }
                }
              }
              if (Field[tempI][tempJ].type==KING)
              {
                if (Field[tempI][tempJ].colour==WHITE)
                {
                  if (i!=tempI||j!=tempJ)
                  {
                    whiteKingMoved=true;
                  }
                } else
                {
                  if (i!=tempI||j!=tempJ)
                  {
                    blackKingMoved=true;
                  }
                }
                if (tempJ+2==j)
                {
                  Field[i][8].type=FREE;
                  Field[i][8].colour=FREE;
                  Field[i][6].type=ROOK;
                  Field[i][6].colour=Field[tempI][tempJ].colour;
                }
                if (tempJ-3==j)
                {
                  Field[i][1].type=FREE;
                  Field[i][1].colour=FREE;
                  Field[i][3].type=ROOK;
                  Field[i][3].colour=Field[tempI][tempJ].colour;
                }
              }
              if (Field[tempI][tempJ].type==ROOK)
              {
                if (Field[tempI][tempJ].colour==WHITE)
                {
                  if (i!=tempI||j!=tempJ)
                  {
                    if (tempJ==1)
                    {
                      whiteLongRookMoved=true;
                    } else if (tempJ==8)
                    {
                      whiteShortRookMoved=true;
                    }
                  }
                } else
                {
                  if (i!=tempI||j!=tempJ)
                  {
                    if (tempJ==1)
                    {
                      blackLongRookMoved=true;
                    } else if (tempJ==8)
                    {
                      blackShortRookMoved=true;
                    }
                  }
                }
              }
              Field[tempI][tempJ].type=FREE;
              Field[tempI][tempJ].colour=FREE;
              Field[i][j].type=Temp.type;
              Field[i][j].colour=Temp.colour;
              Selected=!Selected;
              resetHighlight();
            }
          }
        }
      }
    }
  } else
  {
    if (mouseY>300&&mouseY<400)
    {
      if (mouseX>200&&mouseX<300)
      {
        if (pawnColor==WHITE)
        {
          Field[1][pawnJ].type=ROOK;
          Field[1][pawnJ].colour=WHITE;
        } else
        {
          Field[8][pawnJ].type=ROOK;
          Field[8][pawnJ].colour=BLACK;
        }
      }
      if (mouseX>300&&mouseX<400)
      {
        if (pawnColor==WHITE)
        {
          Field[1][pawnJ].type=KNIGHT;
          Field[1][pawnJ].colour=WHITE;
        } else
        {
          Field[8][pawnJ].type=KNIGHT;
          Field[8][pawnJ].colour=BLACK;
        }
      }
      if (mouseX>400&&mouseX<500)
      {
        if (pawnColor==WHITE)
        {
          Field[1][pawnJ].type=BISHOP;
          Field[1][pawnJ].colour=WHITE;
        } else
        {
          Field[8][pawnJ].type=BISHOP;
          Field[8][pawnJ].colour=BLACK;
        }
      }
      if (mouseX>500&&mouseX<600)
      {
        if (pawnColor==WHITE)
        {
          Field[1][pawnJ].type=QUEEN;
          Field[1][pawnJ].colour=WHITE;
        } else
        {
          Field[8][pawnJ].type=QUEEN;
          Field[8][pawnJ].colour=BLACK;
        }
      }
      if (mouseX>200&&mouseX<600)
        playing=true;
    }
  }
}
void keyPressed()
{
  if (keyCode==SHIFT)
  {
    setField();
  }
}
