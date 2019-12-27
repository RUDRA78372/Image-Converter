unit Unit1;

interface

uses
  System.SysUtils, System.Types, System.UITypes, System.Classes, System.Variants,
  FMX.Types, FMX.Controls, FMX.Forms, FMX.Graphics, FMX.Dialogs, FMX.Objects,
  FMX.StdCtrls, FMX.Edit, FMX.Controls.Presentation;

type
  TForm1 = class(TForm)
    Label1: TLabel;
    Edit1: TEdit;
    Button1: TButton;
    Button2: TButton;
    Edit2: TEdit;
    Label2: TLabel;
    Image1: TImage;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    StyleBook1: TStyleBook;
    Panel1: TPanel;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private
    { Private declarations }
  public
    { Public declarations }
  end;

var
  Form1: TForm1;

implementation

{$R *.fmx}

procedure TForm1.Button1Click(Sender: TObject);
begin
    OpenDialog1.Filter := FMX.Graphics.TBitmapCodecManager.GetFilterString;
    OpenDialog1.Execute;
    Edit1.Text:=OpenDialog1.FileName;
    if Edit1.Text <> '' then
    Image1.Bitmap.LoadFromFile(Edit1.Text)
    else
    ShowMessage('No file Selected');
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    SaveDialog1.Filter := FMX.Graphics.TBitmapCodecManager.GetFilterString;
    SaveDialog1.Execute;
    Edit2.Text:=SaveDialog1.FileName;
    if Edit2.Text <> '' then
    Image1.Bitmap.SaveToFile(Edit2.Text)
    else
    ShowMessage('No file Selected');
end;

end.
