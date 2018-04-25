unit Modelo;

interface

uses
  Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls, Forms,
  Dialogs, StdCtrls, Text, Buttons, ExtCtrls, Grids, DBGrids, DB,
  IBDatabase, IBCustomDataSet, IBQuery, Combo, DBClient, ComCtrls;

type
  TfrmModelo = class(TForm)
    PnlBanco: TPanel;
    Label1: TLabel;
    Label2: TLabel;
    Shape1: TShape;
    SpbBanco: TSpeedButton;
    BibConfirmar: TBitBtn;
    TxtBDAtu: TText;
    OpdBase1: TOpenDialog;
    QryMaster: TIBQuery;
    ItrBD1: TIBTransaction;
    IdbTab1: TIBDatabase;
    DasGeral: TDataSource;
    lbl1: TLabel;
    shp1: TShape;
    Label3: TLabel;
    lblCaminho: TLabel;
    txtTabela: TText;
    procedure SpbBancoClick(Sender: TObject);
    procedure BibConfirmarClick(Sender: TObject);
    procedure lblCaminhoMouseLeave(Sender: TObject);
    procedure lblCaminhoMouseMove(Sender: TObject; Shift: TShiftState; X,
      Y: Integer);
    procedure FormShow(Sender: TObject);
    procedure lblCaminhoClick(Sender: TObject);
  private
    { Private declarations }
    nMaiorNome, nMaiorTipo, nAux: Integer;
    FCaminhoSalvarArquivo: String;

    Function  fValida(StrCpo: String): Boolean ;
    Function  fConecta(): Boolean ;
    Procedure pGerarArquivo();
    Function  PadR(StrTxt: String; IntTam: Integer): String;
    Function  Espacos(IntQtd: Integer): String;
    Procedure setCaminhoSalvarArquivo();
  public
    { Public declarations }
  end;

var
  frmModelo: TfrmModelo;

implementation

{$R *.dfm}

function TfrmModelo.PadR(StrTxt: String; IntTam: Integer): String;
Var i: Integer;
Begin

   i := Length(StrTxt) ;

   If i >= IntTam Then
      Begin
         PadR := Copy(StrTxt,1,IntTam);
         Exit;
      End;

   i := ( IntTam - i );

   PadR := StrTxt + Espacos(i) ;

end;

function TfrmModelo.Espacos(IntQtd: Integer): String;
begin
   Espacos := StringOfChar(' ',IntQtd);
end;

function TfrmModelo.fValida(StrCpo: String): Boolean;
begin

   fValida := False;

   If ( StrCpo = '1' ) Or ( StrCpo = 'GERAL' ) Then
      Begin
      
         If ( Trim(TxtBDAtu.Text) = '' ) Then
            Begin

               MessageDlg('Caminho do banco de dados atualizado é obrigatório !', mtWarning, [mbOk], 0);
               TxtBDAtu.SetFocus;
               Exit;
               
            End
         Else If Not FileExists( TxtBDAtu.Text ) Then
            Begin

               Application.MessageBox('Arquivo de Base de Dados Inexistente!','Base',Mb_OK+MB_IconError);
               TxtBDAtu.Text := '';
               TxtBDAtu.SetFocus;
               Exit;

            End;
            
      End;

   If ( StrCpo = '2' ) Or ( StrCpo = 'GERAL' ) Then
      Begin

         If ( Trim(txtTabela.Text) = '' ) Then
            Begin

               MessageDlg('Tabela é obrigatória !', mtWarning, [mbOk], 0);
               txtTabela.SetFocus;
               Exit;

            End;
      End;

   fValida := True ;

end;

procedure TfrmModelo.lblCaminhoClick(Sender: TObject);
begin
   setCaminhoSalvarArquivo();
end;

procedure TfrmModelo.lblCaminhoMouseLeave(Sender: TObject);
begin
   lblCaminho.Font.Style := [fsBold];
   Screen.Cursor := crDefault;
end;

procedure TfrmModelo.lblCaminhoMouseMove(Sender: TObject; Shift: TShiftState; X,
  Y: Integer);
begin
   lblCaminho.Font.Style := [fsBold, fsUnderline];
   Screen.Cursor := crHandPoint;
end;

procedure TfrmModelo.SpbBancoClick(Sender: TObject);
begin

   OpdBase1.InitialDir := ExtractFilePath( TxtBDAtu.Text ) ;

   If OpdBase1.Execute Then
      Begin

         If Trim( OpdBase1.FileName ) <> '' Then
            Begin

               TxtBDAtu.Text := OpdBase1.FileName;
               fValida('1');

            End;

      End;

end;

procedure TfrmModelo.BibConfirmarClick(Sender: TObject);
var
    StrSql: String ;
begin

   nMaiorNome := 0 ;
   nMaiorTipo := 0 ;
   nAux       := 0 ;

   If not fValida('GERAL') Then Exit ;
   If Not fConecta() Then Exit ;

   Screen.Cursor := crHourGlass ;
   frmModelo.Refresh;

   StrSql := ' SELECT DISTINCT RDB$RELATION_NAME ' +
             '   FROM RDB$RELATION_FIELDS        ' +
             '  WHERE RDB$SYSTEM_FLAG=0          ' +
             '    AND TRIM(RDB$RELATION_NAME) =  ' + QuotedStr(UpperCase(Trim(txtTabela.Text)));  

   If QryMaster.Active Then QryMaster.Close ;
   QryMaster.SQL.Text := StrSql;
   QryMaster.Open ;

   If QryMaster.RecordCount = 0 Then
      Begin
         MessageDlg('Não existe esta tabela no banco de dados !', mtWarning, [mbOk], 0);
         If txtTabela.CanFocus Then txtTabela.SetFocus ;
      End
   Else
      Begin

         StrSql := ' SELECT distinct r.RDB$FIELD_NAME AS field_name,                          ' +
                   '   CASE f.RDB$FIELD_TYPE                                                  ' +
                   '      WHEN 261 THEN ' + QuotedStr('TMemoryStream')                          +
                   '      WHEN 14  THEN ' + QuotedStr('Char')                                   +
                   '      WHEN 40  THEN ' + QuotedStr('CString')                                +
                   '      WHEN 11  THEN ' + QuotedStr('D_float')                                +
                   '      WHEN 27  THEN ' + QuotedStr('Double')                                 +
                   '      WHEN 10  THEN ' + QuotedStr('Float')                                  +
                   '      WHEN 16  THEN ' + QuotedStr('Double')                                 +
                   '      WHEN 8   THEN ' + QuotedStr('Integer')                                +
                   '      WHEN 9   THEN ' + QuotedStr('Quad')                                   +
                   '      WHEN 7   THEN ' + QuotedStr('Smallint')                               +
                   '      WHEN 12  THEN ' + QuotedStr('TDateTime')                              +
                   '      WHEN 13  THEN ' + QuotedStr('Time')                                   +
                   '      WHEN 35  THEN ' + QuotedStr('Timestamp')                              +
                   '      WHEN 37  THEN ' + QuotedStr('String')                                 +
                   '      ELSE          ' + QuotedStr('UNKNOWN')                                +
                   '    END AS field_type                                                     ' +

                   '   FROM RDB$RELATION_FIELDS r                                             ' +
                   '   LEFT JOIN RDB$FIELDS f ON r.RDB$FIELD_SOURCE = f.RDB$FIELD_NAME        ' +
                   '  WHERE r.RDB$RELATION_NAME= ' + QuotedStr(UpperCase(Trim(txtTabela.Text))) +
                   '  ORDER BY r.RDB$FIELD_POSITION ' ;

         If QryMaster.Active Then QryMaster.Close ;
         QryMaster.SQL.Text := StrSql;
         QryMaster.Open ;

         { Gerar Arquivo .PAS }
         pGerarArquivo();

      End;

   frmModelo.Refresh;
   Screen.Cursor := crDefault ;

end;

function TfrmModelo.fConecta: Boolean;
begin

   fConecta   := True ;

   Try
   
      With IdbTab1 Do
         Begin
            Close ;
            DatabaseName := TxtBDAtu.Text ;
            Open;
         End;

   Except
      MessageDlg('Não foi possível conectar-se ao servidor de dados atualizado.', mtWarning, [mbOk], 0);
      TxtBDAtu.SetFocus ;
      fConecta := False ;
      Exit;
   End;

end;

procedure TfrmModelo.FormShow(Sender: TObject);
begin
   FCaminhoSalvarArquivo := Trim(lblCaminho.Caption);
end;

procedure TfrmModelo.pGerarArquivo;
var
   Txt: TextFile;
   cAux: String;
   bAdd3: Boolean;
   nMaiorNomeAux: Integer;
begin

   cAux := '' ;
   nMaiorNome := 0 ;

   Try

      AssignFile(Txt, FCaminhoSalvarArquivo + 'Unt' + Trim(txtTabela.Text) + '.pas');
      ReWrite(Txt);

      Writeln(txt, 'unit Unt' + Trim(txtTabela.Text) + ';');
      Writeln(txt, '');
      Writeln(txt, 'interface');
      Writeln(txt, '');
      Writeln(txt, 'Uses ' + #13#10 + '  SysUtils, Classes;');
      Writeln(txt, '');
      Writeln(txt, 'type' + #13#10 + '  T' + Trim(txtTabela.Text) + ' = class');
      Writeln(txt, '  private');

      QryMaster.First;
      While Not QryMaster.Eof Do
         Begin

           Writeln(txt, '    F' + UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)) + ': ' +
                                            Trim(QryMaster.FieldByName('field_type').AsString)  + ';' );



           { Tipo com maior quantidade de letra }
           nAux := Length(Trim(QryMaster.FieldByName('field_type').AsString));
           If ( nAux > nMaiorTipo ) Then
              nMaiorTipo := nAux;

           { Maior Nome }
           nAux := Length(Trim(QryMaster.FieldByName('field_name').AsString));
           If ( nAux > nMaiorNome ) Then
              nMaiorNome := nAux;

           QryMaster.Next;

         End;

      WriteLn(txt, '');  

      { =======================================================================================================}

      bAdd3 := False ;
      QryMaster.First;
      While Not QryMaster.Eof Do
         Begin

           If ( UpperCase(Trim(QryMaster.FieldByName('field_type').AsString)) = 'STRING' ) Then
              Begin

                 Writeln(txt, '    procedure Set' + UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)) +
                              '(const Value: String);');

                 bAdd3 := True;

              End;

           QryMaster.Next;

         End;

      Writeln(txt, '');
      Writeln(txt, '  public');

     { =======================================================================================================}

     nMaiorNomeAux := nMaiorNome;
     If bAdd3 Then nMaiorNome := nMaiorNome + 3;
        
     QryMaster.First;
      While Not QryMaster.Eof Do
         Begin

            Write(txt, '    property ' + UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)) + ': '          +
                                              padR(Trim(QryMaster.FieldByName('field_type').AsString),  nMaiorTipo)    + ' read F' +
                                    padR(UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)), nMaiorNomeAux) + ' write ' );


            If ( UpperCase(Trim(QryMaster.FieldByName('field_type').AsString)) = 'STRING' ) Then
               cAux := 'Set'
            Else
               cAux := 'F';

            Write(Txt, PadR(cAux + UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)), nMaiorNome) + ' ;' ) ;

            WriteLn(txt, '');
            QryMaster.Next;

         End;

      Writeln(txt, '');   
      Writeln(txt, '  end;');
      Writeln(txt, '');
      Writeln(txt, 'implementation');
      Writeln(txt, '');
      Writeln(txt, '{ T' + Trim(txtTabela.Text) + ' }');
      Writeln(txt, '');

      { =======================================================================================================}

      QryMaster.First;
      While Not QryMaster.Eof Do
         Begin

            If ( UpperCase(Trim(QryMaster.FieldByName('field_type').AsString)) = 'STRING' ) Then
               Begin

                  Writeln(txt, 'procedure T' + Trim(txtTabela.Text) + '.Set' +
                               UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)) +
                               '(const Value: String);'  );

                  Writeln(txt, 'begin');
                  Writeln(txt, '  F' + UpperCase(Trim(QryMaster.FieldByName('field_name').AsString)) + ' := Trim(Value);');
                  Writeln(txt, 'end;');
                  Writeln(txt, '');
                  
               End;
               
            QryMaster.Next;

         End;


      Write(txt, 'end.');
      MessageDlg('Arquivo gerado com sucesso !', mtWarning, [mbOk], 0);
      
   Except
      MessageDlg('Error ao gerar o arquivo !', mtWarning, [mbOk], 0);
   End;

   CloseFile(txt);

end;

procedure TfrmModelo.setCaminhoSalvarArquivo();
var
  caminho: String;
  ultimoChar: String;
begin
   caminho := Trim(InputBox('Salvar em...', 'Caminho da pasta: ', lblCaminho.Caption));
   ultimoChar := Copy(caminho, length(caminho));

   If (ultimoChar <> '\') Then
      caminho := caminho + '\';

   If Not DirectoryExists(caminho) Then
      Begin
         ShowMessage('Pasta não localizada!');
         setCaminhoSalvarArquivo();
      End
   Else
      Begin
         FCaminhoSalvarArquivo := caminho;
         lblCaminho.Caption := FCaminhoSalvarArquivo;
      End;
end;

end.
