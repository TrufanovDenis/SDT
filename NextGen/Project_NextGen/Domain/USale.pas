unit USale;

interface

uses USalesLineItem, UPayment, UMoney,UProductDescription, SysUtils, Generics.Collections, Generics.Defaults;

type

  TSale = class
  private
    lineitems: Tlist<TSalesLineItem>;
    data:TDate;
    Complete:boolean;
    payment:TPayment;
  published
    constructor create;
  public
    function getBalance:TMoney;
    procedure becomeComplete;
    function  isComplete:boolean;
    procedure makeLineItem(desc:TProductDescription; quantity: integer);
    function getTotal:Tmoney;
    procedure makePayment(cashTendered:TMoney);
  end;
implementation


{ TSale }

procedure TSale.becomeComplete;
begin
  Complete:=true;
end;

constructor TSale.create;
begin
  lineitems:=Tlist<TSalesLineItem>.create;
  Complete:=false;
  Payment:=TPayment.Create;
end;

function TSale.getBalance: TMoney;
begin
  result:=Payment.getAmount - getTotal;
end;

function TSale.getTotal: Tmoney;
var
  total,subTotal:Tmoney;
  SalesLIneItem:TSalesLineItem;
begin
  total:=0;
  subTotal:=0;
  for SalesLineItem in lineitems do begin
    subTotal:=SalesLineItem.getSubTotal;
    total:=total + subtotal;
  end;
  result:=total;
end;

function TSale.isComplete: boolean;
begin
  result:=complete;
end;

procedure TSale.makeLineItem(desc: TProductDescription; quantity: integer);
var
  saleslineitem:TSalesLineItem;
  i:integer;
begin
  saleslineitem:=TSalesLineItem.create;
  saleslineitem.saleslineitem(desc,quantity);
  i:=lineitems.Add(saleslineitem);
end;

procedure TSale.makePayment(cashTendered:TMoney);
begin
  payment:=TPayment.Create;
  payment.payment(cashTendered);
end;

end.
