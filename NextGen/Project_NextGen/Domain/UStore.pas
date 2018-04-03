unit UStore;

interface

uses UProductCatalog, URegister;

type

  TStore = class
  private
  Catalog:TProductCatalog;
  register1:TRegister;
  published
  constructor create;
  public
  function getregister:TRegister;
  end;

implementation

{ TStore }

constructor TStore.create;
begin
  catalog:=TProductCatalog.create;
  register1:=TRegister.create(catalog);
end;

function TStore.getregister: TRegister;
begin
  result:=register1;
end;

end.
