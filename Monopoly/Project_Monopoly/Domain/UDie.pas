unit UDie;

interface

type
  TDie = class
  const
    MAX=6;
  private
    faceValue:integer;
  public
    procedure roll;
    function getFaceValue:integer;
  published
    constructor Create;
  end;

implementation

{ TDie }

constructor TDie.Create;
begin
  roll;
end;

function TDie.getFaceValue: integer;
begin
  result:=faceValue;
end;

procedure TDie.roll;
begin
  faceValue:=random(MAX)+1;
end;

end.
