boolean Selected=false;
Piece Temp=new Piece();
int tempI, tempJ;
void mousePressed()
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
}
void keyPressed()
{
  if (keyCode==SHIFT)
  {
    setField();
  }
}
