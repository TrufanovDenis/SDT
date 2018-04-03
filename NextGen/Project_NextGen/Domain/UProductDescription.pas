unit UProductDescription;

interface

uses UItemId, UMoney;

type

  TProductDescription = class
  private
    id:TItemID;
    price:TMoney;
    description:string;
  public
    procedure ProductDescription(id:TItemId; price:TMoney; description:string);
    function getItemID:TItemID;
    function getPrice:TMoney;
    function getDescription:String;
  end;

implementation

{ TProductDescription }

function TProductDescription.getDescription: String;
begin
  result:=description;
end;

function TProductDescription.getItemID: TItemID;
begin
  result:=id;
end;

function TProductDescription.getPrice: TMoney;
begin
  result:=price;
end;

procedure TProductDescription.ProductDescription(id: TItemId; price: TMoney;
  description: string);
begin
  self.id:=id;
  self.price:=price;
  self.description:=description;
end;

end.
