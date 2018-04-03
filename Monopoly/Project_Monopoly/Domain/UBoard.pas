unit UBoard;

interface

uses SysUtils, Classes, Generics.Collections, Generics.Defaults, USquare;

type
  TBoard = class
  const
    SIZE=40;
  private
    squares:TList<TSquare>;
    procedure buildSquares;
    procedure build(i:integer);
    procedure linkSquares;
    procedure link(i:integer);
  public
    function getSquare(start:TSquare;distance:integer):TSquare;
    function getStartSquare:TSquare;
  published
    constructor Create;
  end;
implementation




{ TBoard }

procedure TBoard.build(i: integer);
var
  s:TSquare;
begin
  s:=TSquare.Create('Square'+inttostr(i),i);
  squares.Add(s);
end;

procedure TBoard.buildSquares;
var
  i:integer;
begin
  squares:=TList<TSquare>.Create;
  for i:=0 to SIZE-1 do
    build(i);
end;

constructor TBoard.Create;
begin
  buildSquares;
  linkSquares;
end;

function TBoard.getSquare(start: TSquare; distance: integer): TSquare;
var
  endIndex:integer;
begin
  endIndex:=(start.getIndex+distance);
  result:=squares.Items[endIndex];
end;

function TBoard.getStartSquare: TSquare;
begin
  result:=squares.First;
end;

procedure TBoard.link(i: integer);
var
  next,current:TSquare;
begin
  current:=squares.Items[i];
  next:=squares.Items[i];
  current.setNextSquare(next);
end;

procedure TBoard.linkSquares;
var
  i:integer;
  first,last:TSquare;
begin
  for i:=0 to (SIZE-1) do
    link(i);
  first:=squares.First;
  last:=squares.Last;
  last.setNextSquare(first);
end;

end.
