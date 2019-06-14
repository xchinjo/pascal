unit Unit1;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs,

    IdURI, IdHTTP, IdException, IdStack, IdMultipartFormData,SynCommons,
  Vcl.StdCtrls;

type
  TForm1 = class(TForm)
    Button1: TButton;
    edMessage: TEdit;
    edToken: TEdit;
    Label2: TLabel;
    procedure Button1Click(Sender: TObject);
  private
    { Private declarations }
    procedure LineSendNotify(Token, msg: RawUTF8;sticker:boolean;sticker_group,sticker_id:integer);
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.dfm}

procedure TForm1.Button1Click(Sender: TObject);
begin
  LineSendNotify(edToken.Text,edMessage.Text,false,0,0);
end;

procedure TForm1.LineSendNotify(Token, msg: RawUTF8; sticker: boolean;
  sticker_group, sticker_id: integer);
var
  Response: String;
  HTTPClient: TidHTTP;
  StrStreem: TStringStream;
  wMsg:string;
begin
  if sticker then
    wMsg := 'stickerPackageId='+inttostr(sticker_group)+'&stickerId='+inttostr(sticker_id)+'&message='+msg
  else
     wMsg := 'message='+msg;
  StrStreem := TStringStream.Create(wMsg, TEncoding.UTF8);
  try
    HTTPClient := TidHTTP.Create;
    try
        with HTTPClient do
        begin
            HandleRedirects := True;
            request.Method := 'POST';
            request.ContentType := 'application/x-www-form-urlencoded';
            Request.CustomHeaders.FoldLines := False;
            request.CustomHeaders.Add('Authorization:Bearer '+Token);
        end;
        Response := HTTPClient.Post('https://notify-api.line.me/api/notify', StrStreem);

    finally
      HTTPClient.Free;
    end;
  finally
    StrStreem.Free ;
  end;

end;

end.
