unit UPlayer;

interface

uses SysUtils, Classes, Generics.Collections, Generics.Defaults, UPiece, UBoard, UDie, USquare;

type
  TPlayer = class
  private
    name:string;
    piece:TPiece;
    board:TBoard;
    dice:TList<TDie>;
  public
    procedure takeTurn;
    function getLocation:TSquare;
    function getName:string;
  published
    constructor Create(name:string; dice:TDie; board:TBoard);
  end;

implementation

{ TPlayer }

constructor TPlayer.Create(name: string; dice: TDie; board: TBoard);
begin
  self.name:=name;
  self.dice := TList<TDie>.create;
  self.dice.Add(dice);
  self.dice.Add(dice);
  self.board:=board;
  piece:=TPiece.create(board.getStartSquare);
end;

function TPlayer.getLocation: TSquare;
begin
  result:=piece.getLocation;
end;

function TPlayer.getName: string;
begin
  result:=name;
end;

procedure TPlayer.takeTurn;
var
  rollTotal, i:integer;
  newLoc:TSquare;
begin
  rollTotal:=0;
  for i:=0 to dice.Count-1 do begin
    dice.Items[i].roll;
    rollTotal:=rollTotal+self.dice.Items[i].getFaceValue;
  end;
  newLoc:=board.getSquare(piece.getLocation, rollTotal);
  piece.setLocation(newLoc);
end;

end.
