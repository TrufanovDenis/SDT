program Project1;

uses
  Vcl.Forms,
  Unit1 in 'UI\Unit1.pas' {Form1},
  UBoard in 'Domain\UBoard.pas',
  UDie in 'Domain\UDie.pas',
  UMonopolyGame in 'Domain\UMonopolyGame.pas',
  UPiece in 'Domain\UPiece.pas',
  UPlayer in 'Domain\UPlayer.pas',
  USquare in 'Domain\USquare.pas';

{$R *.res}

begin
  Application.Initialize;
  Application.MainFormOnTaskbar := True;
  Application.CreateForm(TForm1, Form1);
  Application.Run;
end.
