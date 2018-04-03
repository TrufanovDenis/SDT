unit USquare;

interface

type
  TSquare=class
  private
    name:string;
    nextSquare:TSquare;
    index:integer;
  public
    procedure setNextSquare(s:TSquare);
    function getNextSquare:TSquare;
    function getName:string;
    function getIndex:integer;
  published
    constructor Create(name:string; index:integer);
  end;

implementation

{ TSquare }

constructor TSquare.Create(name: string; index: integer);
begin
  self.name:=name;
  self.index:=index;
end;

function TSquare.getIndex: integer;
begin
  result:=index;
end;

function TSquare.getName: string;
begin
  result:=name;
end;

function TSquare.getNextSquare: TSquare;
begin
  result:=nextSquare;
end;

procedure TSquare.setNextSquare(s: TSquare);
begin
  nextSquare:=s;
end;

end.
