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
void loadShapes()
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
void setField()
{
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
void resetHighlight()
{
  for (int i=1; i<=8; i++)
    for (int j=1; j<=8; j++)
    {
      Field[i][j].highlighted=false;
    }
}
