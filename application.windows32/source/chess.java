import processing.core.*; 
import processing.data.*; 
import processing.event.*; 
import processing.opengl.*; 

import java.util.HashMap; 
import java.util.ArrayList; 
import java.io.File; 
import java.io.BufferedReader; 
import java.io.PrintWriter; 
import java.io.InputStream; 
import java.io.OutputStream; 
import java.io.IOException; 

public class chess extends PApplet {


boolean negru=true;
public void setup()
{
  
  textSize(32);
  textAlign(LEFT, TOP);
  shapeMode(CORNER);
  loadShapes();
  setField();
  rectMode(CORNER);
}
public void draw()
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
          fill(0xff74693D);
        } else {
          fill(0xffE3CE76);
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
          fill(0xff74693D);
        } else {
          fill(0xffE3CE76);
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
boolean Selected=false;
boolean playing=true; 
int pawnColor, pawnJ;
Piece Temp=new Piece();
int tempI, tempJ;
public void mousePressed()
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
public void keyPressed()
{
  if (keyCode==SHIFT)
  {
    setField();
  }
}
Piece[][] Field=new Piece[9][9];
int[] di={-2, -1, +1, +2, +2, +1, -1, -2};
int[] dj={+1, +2, +2, +1, -1, -2, -2, -1};
/*
Finals
 */
final int
  FREE=0, PAWN=1, ROOK=2, KNIGHT=3, BISHOP=4, QUEEN=5, KING=6;
final int
  BLACK=-1, WHITE=1;
/*
  Pshapes 
 */
PShape pawn_black, pawn_white, bishop_black, bishop_white, king_black, king_white, knight_black, knight_white, queen_black, queen_white, rook_black, rook_white;
boolean whiteKingMoved=false, blackKingMoved=false, blackLongRookMoved=false, blackShortRookMoved=false, whiteLongRookMoved=false, whiteShortRookMoved=false;
class Piece
{
  Piece()
  {
  }
  Piece(int type, int colour, int i, int j)
  {
    this.type=type;
    this.colour=colour;
    this.i=i;
    this.j=j;
  }
  int type;
  int colour;
  int i; 
  int j;
  boolean highlighted=false;
}
public void loadShapes()
{
  pawn_black=loadShape("bp.svg");
  pawn_white=loadShape("wp.svg"); 
  bishop_black=loadShape("bb.svg");
  bishop_white=loadShape("wb.svg"); 
  king_black=loadShape("bk.svg");
  king_white=loadShape("wk.svg"); 
  knight_black=loadShape("bn.svg"); 
  knight_white=loadShape("wn.svg"); 
  queen_black=loadShape("bq.svg");
  queen_white=loadShape("wq.svg"); 
  rook_black=loadShape("br.svg");
  rook_white=loadShape("wr.svg");
}
public void setField()
{
  playing=true;
  whiteKingMoved=false; 
  blackKingMoved=false; 
  blackLongRookMoved=false; 
  blackShortRookMoved=false; 
  whiteLongRookMoved=false; 
  whiteShortRookMoved=false;
  Selected=false;
  for (int i=1; i<=8; i++)
  {
    for (int j=1; j<=8; j++)
    {
      switch (i)
      {
      case 1:
        {
          switch (j)
          {
          case 1:
            Field[i][j]=new Piece(ROOK, BLACK, i, j);
            break;
          case 8:
            Field[i][j]=new Piece(ROOK, BLACK, i, j);
            break;
          case 2:
            Field[i][j]=new Piece(KNIGHT, BLACK, i, j);
            break;
          case 7:
            Field[i][j]=new Piece(KNIGHT, BLACK, i, j);
            break;
          case 3:
            Field[i][j]=new Piece(BISHOP, BLACK, i, j);
            break;
          case 6:
            Field[i][j]=new Piece(BISHOP, BLACK, i, j);
            break;
          case 4:
            Field[i][j]=new Piece(QUEEN, BLACK, i, j);
            break;
          case 5:
            Field[i][j]=new Piece(KING, BLACK, i, j);
            break;
          }
        }
        break;
      case 2:
        Field[i][j]=new Piece(PAWN, BLACK, i, j);
        break;
      case 7:
        Field[i][j]=new Piece(PAWN, WHITE, i, j);
        break;
      case 8:
        {
          switch (j)
          {
          case 1:
            Field[i][j]=new Piece(ROOK, WHITE, i, j);
            break;
          case 8:
            Field[i][j]=new Piece(ROOK, WHITE, i, j);
            break;
          case 2:
            Field[i][j]=new Piece(KNIGHT, WHITE, i, j);
            break;
          case 7:
            Field[i][j]=new Piece(KNIGHT, WHITE, i, j);
            break;
          case 3:
            Field[i][j]=new Piece(BISHOP, WHITE, i, j);
            break;
          case 6:
            Field[i][j]=new Piece(BISHOP, WHITE, i, j);
            break;
          case 4:
            Field[i][j]=new Piece(QUEEN, WHITE, i, j);
            break;
          case 5:
            Field[i][j]=new Piece(KING, WHITE, i, j);
            break;
          }
        }
        break;
      default:
        Field[i][j]=new Piece(FREE, FREE, i, j);
      }
    }
  }
}
public void resetHighlight()
{
  for (int i=1; i<=8; i++)
    for (int j=1; j<=8; j++)
    {
      Field[i][j].highlighted=false;
    }
}
public void pawnValid(int i, int j )
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
public void rookValid(int i, int j )
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
public void knightValid(int i, int j )
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
public void queenValid(int i, int j )
{
  bishopValid(i, j);
  rookValid(i, j);
}
public void bishopValid(int i, int j )
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
public void kingValid(int i, int j )
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
public void valid(int i, int j)
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
  public void settings() {  size(800, 800); }
  static public void main(String[] passedArgs) {
    String[] appletArgs = new String[] { "chess" };
    if (passedArgs != null) {
      PApplet.main(concat(appletArgs, passedArgs));
    } else {
      PApplet.main(appletArgs);
    }
  }
}
