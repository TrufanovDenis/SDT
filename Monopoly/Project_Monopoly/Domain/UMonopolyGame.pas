unit UMonopolyGame;

interface

uses SysUtils, Classes, Generics.Collections, Generics.Defaults, UBoard, UDie, UPlayer;

type
  TMonopolyGame = class
  const
    ROUNDS_TOTAL=20;
    PLAYERS_TOTAL=2;
  private
    players:TList<TPlayer>;
    board:TBoard;
    dice:TDie;
  public
    procedure playGame;
    function getPlayers: TList<TPlayer>;
    procedure playRound;
  published
    constructor Create;
  end;

implementation

{ TMonopolyGame }

constructor TMonopolyGame.Create;
var
  p:TPlayer;
begin
  dice:=TDie.Create;
  players:=TList<TPlayer>.create;
  board:=TBoard.Create;
  p:=TPlayer.Create('Лошадь', dice, board);
  players.Add(p);
  p:=Tplayer.Create('Автомобиль', dice, board);
  players.Add(p);
end;

function TMonopolyGame.getPlayers: TList<TPlayer>;
begin
  result:=players;
end;

procedure TMonopolyGame.playGame;
var
  i:integer;
begin
  for i:=0 to ROUNDS_TOTAL do playRound;
end;

procedure TMonopolyGame.playRound;
var
  player:TPlayer;
begin
  for player in players do
    player.takeTurn;
end;

end.
