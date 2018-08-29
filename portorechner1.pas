unit PortoRechner1;

{$mode objfpc}{$H+}

interface

uses
  Classes, SysUtils, FileUtil, Forms, Controls, Graphics, Dialogs, StdCtrls,
  ExtCtrls;

type

  { TfrmPortoRechner }

  TfrmPortoRechner = class(TForm)
    cmdClose: TButton;
    cmdBerechnen: TButton;
    lblHeader: TLabel;
    txtGewicht: TEdit;
    frmPortoRechner: TLabel;
    lblGewicht: TLabel;
    pnlPorto: TPanel;
    procedure cmdBerechnenClick(Sender: TObject);
    procedure cmdCloseClick(Sender: TObject);
    procedure txtGewichtChange(Sender: TObject);
  private

  public

  end;

var
  frmPortoRechner: TfrmPortoRechner;

implementation

{$R *.lfm}

{ TfrmPortoRechner }

procedure TfrmPortoRechner.cmdCloseClick(Sender: TObject);
// Beenden Button - Programm beenden
begin
  close;
end;

procedure TfrmPortoRechner.txtGewichtChange(Sender: TObject);
// Änderungen im Eingabefeld lösen sofortige Berechnung aus
begin
  cmdBerechnenClick(txtGewicht) // Berechnen Button wird gedrückt
end;

procedure TfrmPortoRechner.cmdBerechnenClick(Sender: TObject);
// Variablendefinition für Gewicht und Fehler
var gewicht, error : integer;
begin
     // Validieren der Eingabe und Variablen initialisieren
     val(txtGewicht.Text, gewicht, error);
     if error = 0 then // Wenn Error 0 dann Integer Wert vorhanden
        begin
          pnlPorto.visible := True; // pnl anzeigen
          if gewicht <= 20 then     // Gewicht entspr. Portoklassen prüfen
             begin
               pnlPorto.caption := 'Standardbrief 0,70 €';  // pnl Caption entspr. setzen
             end
          else
              begin
                 if gewicht <= 50 then
                    begin
                       pnlPorto.caption := 'Kompaktbrief 0,85 €';
                    end
                 else
                     begin
                        if gewicht <= 500 then
                           begin
                            pnlPorto.caption := 'Großbrief 1,45 €';
                           end
                        else
                            begin
                               if gewicht <= 1000 then
                                  begin
                                   pnlPorto.caption := 'Maxibrief 2,60 €';
                                  end
                               else
                                   begin
                                      if gewicht <= 2000 then
                                         begin
                                              pnlPorto.caption := 'Maxibrief Plus 4,80 €';
                                         end
                                      else // über 2000 kein Brief mehr
                                          pnlPorto.caption := 'Paketrechner benutzen!';
                                   end
                            end
                     end
              end
        end
     else // Wenn Error <> 0 kein Integer -> keine Anzeige
          pnlPorto.visible := False;
end;

end.

