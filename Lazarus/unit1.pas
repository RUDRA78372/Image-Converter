unit Unit1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, Forms, Controls, Graphics, Dialogs, StdCtrls, ExtCtrls;

type

  { TForm1 }

  TForm1 = class(TForm)
    Button1: TButton;
    Button2: TButton;
    Edit1: TEdit;
    Edit2: TEdit;
    Image1: TImage;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    OpenDialog1: TOpenDialog;
    SaveDialog1: TSaveDialog;
    procedure Button1Click(Sender: TObject);
    procedure Button2Click(Sender: TObject);
  private

  public

  end;

var
  Form1: TForm1;

implementation

{$R *.lfm}

{ TForm1 }
var
  FS:TFileStream;
procedure TForm1.Button1Click(Sender: TObject);
begin
      OpenDialog1.Filter := 'Bitmap files (*.bmp)|*.bmp|JPEG files(*.jpg)|*.jpg|JPEG files(*.jpeg)|*.jpeg|PNG files(*.png)|*.png|Icon files(*.ico)|*.ico';
      OpenDialog1.Execute;
      Edit1.Text:=OpenDialog1.FileName;
      if Edit1.Text <> '' then
      begin
      FS:=TFileStream.Create(Edit1.Text,fmOpenRead);
      if ExtractFileExt(Edit1.Text) = '.bmp' then
      Image1.Picture.Bitmap.LoadFromStream(FS,FS.Size)
      else if (ExtractFileExt(Edit1.Text) = '.jpg') or (ExtractFileExt(Edit1.Text) = '.jpeg') then
      Image1.Picture.jpeg.LoadFromStream(FS,FS.Size)
      else if ExtractFileExt(Edit1.Text) = '.png' then
      Image1.Picture.png.LoadFromStream(FS,FS.Size)
      else if ExtractFileExt(Edit1.Text) = '.ico' then
      Image1.Picture.icon.LoadFromStream(FS,FS.Size);
      FS.free;
      end
      else
      ShowMessage('No file Selected');
      Image1.Picture.Icon;
end;

procedure TForm1.Button2Click(Sender: TObject);
begin
    SaveDialog1.Filter := 'Bitmap files (*.bmp)|*.bmp|JPEG files(*.jpg)|*.jpg|JPEG files(*.jpeg)|*.jpeg|PNG files(*.png)|*.png|Icon files(*.ico)|*.ico';
    SaveDialog1.Execute;
    Edit2.Text:=SaveDialog1.FileName;
    if Edit2.Text <> '' then
    begin
         FS:=TFileStream.Create(Edit2.Text,fmCreate);
      if ExtractFileExt(Edit2.Text) = '.bmp' then
      Image1.Picture.Bitmap.SavetoStream(FS)
      else if (ExtractFileExt(Edit1.Text) = '.jpg') or (ExtractFileExt(Edit1.Text) = '.jpeg') then
      Image1.Picture.jpeg.SavetoStream(FS)
      else if ExtractFileExt(Edit2.Text) = '.png' then
      Image1.Picture.png.SavetoStream(FS)
      else if ExtractFileExt(Edit1.Text) = '.ico' then
      Image1.Picture.icon.SaveToStream(FS);
      FS.free;
    end
    else
    ShowMessage('No file Selected');
end;

end.

