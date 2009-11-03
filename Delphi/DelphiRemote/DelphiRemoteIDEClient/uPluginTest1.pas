unit uPluginTest1;

interface

uses uDelphiRemoteIDEClient, uDelphiRemoteIDEClientPlugin;

type
  TTestPlugin = class(TDelphiRemoteIDEClientPlugin)
  protected
    function GetHelpText : string; override;
  public
    procedure Abc;
  end;

implementation

uses
  Dialogs;

{ TTestPlugin }

procedure TTestPlugin.Abc;
begin
  showmessage('abc');
end;

var
  myPlugin: TTestPlugin;

function TTestPlugin.GetHelpText: string;
begin
  Result:='Test';
end;

initialization
  myPlugin:=TTestPlugin.Create;
  GlobalDelphiRemoteIDEClient.RegisterChild('testPlugin', myPlugin);

finalization
  GlobalDelphiRemoteIDEClient.UnregisterChild(myPlugin);
  myPlugin.Free;

end.
