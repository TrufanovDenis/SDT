unit URegister;

interface

uses UProductCatalog,USale,UItemID,UProductDescription,UMoney;
type

  TRegister = class
  private
    catalog:TProductCatalog;
    currentSale:TSale;
  published
    constructor create(catalog:TProductCatalog);
  public
    procedure endsale;
    procedure enteritem(id:TItemID; quantity:integer);
    procedure makenewsale;
    procedure makepayment(cashtendered:TMoney);

  end;

implementation

{ TRegister }

constructor TRegister.create(catalog: TProductCatalog);
begin
  self.catalog:=catalog;
end;

procedure TRegister.endsale;
begin
  currentSale.becomeComplete;
end;

procedure TRegister.enteritem(id: TItemID; quantity: integer);
var
  desc:TProductDescription;
begin
  desc:=TProductDescription.Create;
  desc:=Catalog.getProductDescription(id);
  CurrentSale.makelineitem(desc,quantity);
end;

procedure TRegister.makenewsale;
begin
  currentSale:=Tsale.create;
end;

procedure TRegister.makepayment(cashtendered: TMoney);
begin
  currentSale.makePayment(cashTendered);
end;

end.
