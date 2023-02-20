unit MwSt;

interface

uses
  Winapi.Windows, Winapi.Messages, System.SysUtils, System.Variants, System.Classes, Vcl.Graphics,
  Vcl.Controls, Vcl.Forms, Vcl.Dialogs, Vcl.StdCtrls, FileCtrl;

type
  TSteuerabzug = class(TForm)
    txtOriginal: TEdit;
    txtNeuerWert: TEdit;
    btnSteuerabzug: TButton;
    btnCSVDatei: TButton;
    Label1: TLabel;
    Label2: TLabel;
    Label3: TLabel;
    procedure txtOriginalKeyPress(Sender: TObject; var Key: Char);
    procedure btnSteuerabzugClick(Sender: TObject);
    procedure btnCSVDateiClick(Sender: TObject);
  private
    { Private declarations }
    FOrgValue: Double;
    FNewValue: Double;
  public
    { Public declarations }
    constructor Create();
    property OrgValue: Double read FOrgValue write FOrgValue;
    property NewValue: Double read FNewValue write FNewValue;
  end;

var
  Steuerabzug: TSteuerabzug;

implementation

{$R *.dfm}

constructor TSteuerabzug.Create();
begin
  FOrgValue := 0.00;
  FNewValue := 0.00;
end;

{*---------------------------------------------------------------*}

procedure TSteuerabzug.btnCSVDateiClick(Sender: TObject);
var
  f : textfile;
  pfad : string;

  Function CSVDateiPfad: string;
  var
    options : TSelectDirOpts;
  begin
    // Set the starting directory
    Result:= ExtractFilePath(Application.ExeName); // SysUtils

    If SelectDirectory(Result, options, 0) then begin // FileCtrl
      Result := IncludeTrailingPathDelimiter(Result);
    end
    else begin
      showMessage('Achtung: Datei wird in Exe pfad erstellt!!!');
    end;
  end;

  Procedure Schreibe;
  var
    Zeile : AnsiString;
  begin
    Zeile := FloatToStr(Steuerabzug.OrgValue) + ';';
    Zeile := Zeile + Format('%.2f', [Steuerabzug.NewValue]) + ';';
    writeln(f, Zeile);
  end;

  Procedure CSVDateiSchreibe(Verzeichnis : string);
  const
    TempDat = 'CSVDAT.TMP';
    CSVDAT = 'CSVDAT.CSV';
  begin
    If FileExists(Verzeichnis + CSVDAT) then begin
      if FileExists(Verzeichnis + TempDat) then Deletefile(PChar(Verzeichnis + TempDat));
      sleep(50);
      RenameFile(Verzeichnis + CSVDAT, Verzeichnis + TempDat);
    end;

    AssignFile(f, Verzeichnis + TempDat);
    If FileExists(Verzeichnis + TempDat) then begin
      Append(f);
    end
    else begin
      Rewrite(f);
    end;

    try
      Schreibe;
    finally
       CloseFile(f);
       Sleep(50);
       if RenameFile(Verzeichnis + TempDat, Verzeichnis + CSVDAT) then begin
         showMessage('Datei ' + Verzeichnis + CSVDAT + ' erstellt!');
       end
       else begin
         showMessage('Bitte schließen Sie zuerst die Datei ' + Verzeichnis + CSVDAT +
           ' dann versuchen Sie es bitte nochmal.');
       end;
       // Die Felder sollten leer sein
       txtOriginal.Text := '';
       txtNeuerWert.Text := '';
    end;
  end;

begin // btnCSVDateiClick
  If (txtOriginal.Text <> '') then begin
    pfad := CSVDateiPfad;
    If (pfad <> '') then begin
      CSVDateiSchreibe(pfad);
    end
    else begin
      showMessage('Achtung: Das Verzeichnis ist nicht gültig!!!');
    end;
  end
  else begin
    showMessage('Achtung: Bitte geben Sie zuerst den Betrag ein!!!');
  end;
end;

{*---------------------------------------------------------------*}

procedure TSteuerabzug.btnSteuerabzugClick(Sender: TObject);

  Function AbzugRech(Betrag: Double): Double;
  var
    MwSt, Abzug: Double;
  begin
    Result := 0.00;
    MwSt := (Betrag * 19) / 100; // Die Mehrwertsteuer 19% zu berechnen
    Result := Betrag - MwSt;
  end;

begin
  If (txtOriginal.Text <> '') then begin
    Steuerabzug.OrgValue := StrToFloat(txtOriginal.Text);
    // Betrag nach Abzug zu berechnen
    Steuerabzug.NewValue := AbzugRech(Steuerabzug.OrgValue);
    // Nach Abzug ausfüllen
    txtNeuerWert.text := Format('%.2f', [Steuerabzug.NewValue]);
  end
  else begin
    showMessage('Achtung: Bitte geben Sie zuerst den Betrag ein!!!');
  end;
end;

{*---------------------------------------------------------------*}

procedure TSteuerabzug.txtOriginalKeyPress(Sender: TObject; var Key: Char);
var
  MyFormatSettings: TFormatSettings;
begin
  // Nur Zahlen, Rücktaste und Dezimaltrennzeichen einfügen!
  MyFormatSettings := TFormatSettings.Create('de-DE');
  if not (Key in ['0'..'9', Char(VK_BACK), {Char(VK_DELETE),} MyFormatSettings.DecimalSeparator]) then Key := #0;
end;

end.
