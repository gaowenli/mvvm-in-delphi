unit Model.Main;

interface

uses Model.Declarations, Model.Database;

type
  TMainModel = class
  private
    fMainFormLabelsText: TMainFormLabelsText;
    fDatabase: TDatabase;
  public
    function GetMainFormLabelsText: TMainFormLabelsText;
    function GetTotalSales: Currency;
    constructor Create;
    destructor Destroy; override;
  end;

implementation

uses
  System.SysUtils;

{ TMainModel }

constructor TMainModel.Create;
begin
  fDatabase:=TDatabase.Create;
end;

destructor TMainModel.Destroy;
begin
  fDatabase.Free;
  inherited;
end;

function TMainModel.GetMainFormLabelsText: TMainFormLabelsText;
begin
  fMainFormLabelsText.Title:='Main Screen';
  fMainFormLabelsText.IssueButtonCaption:='Issue Invoice';
  fMainFormLabelsText.TotalSalesText:='Total Sales:';
  result:=fMainFormLabelsText;
end;

function TMainModel.GetTotalSales: Currency;
begin
  result:=fDatabase.GetTotalSales;
end;

end.
