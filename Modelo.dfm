object frmModelo: TfrmModelo
  Left = 459
  Top = 243
  BorderIcons = [biSystemMenu, biMinimize]
  BorderStyle = bsSingle
  Caption = 'Gerar modelo para DAO'
  ClientHeight = 114
  ClientWidth = 575
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'MS Sans Serif'
  Font.Style = []
  OldCreateOrder = False
  Position = poScreenCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object PnlBanco: TPanel
    Left = 0
    Top = 0
    Width = 577
    Height = 193
    TabOrder = 0
    object Label1: TLabel
      Left = 40
      Top = 43
      Width = 98
      Height = 14
      Caption = 'Banco Atualizado:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Label2: TLabel
      Left = 2
      Top = 6
      Width = 574
      Height = 14
      Alignment = taCenter
      AutoSize = False
      Caption = 'Gerar modelo para o DAO'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object Shape1: TShape
      Left = 8
      Top = 28
      Width = 554
      Height = 1
    end
    object SpbBanco: TSpeedButton
      Left = 540
      Top = 38
      Width = 23
      Height = 22
      Cursor = crHandPoint
      Hint = 'Selecione o Diretorio do Banco de Dados'
      Flat = True
      Glyph.Data = {
        36030000424D3603000000000000360000002800000010000000100000000100
        18000000000000030000120B0000120B00000000000000000000FF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB1F9FD11293CBFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        9AF3FB6CEAF830B1DC30B1DC30B1DC1FA0D31395CBFF00FFFF00FFFF00FFFF00
        FFFF00FFFF00FFFF00FFFF00FF1696CB90E2F287FFFF7FFBFF81FAFF7DF4FF74
        EEFE69E3F830B1DC30B1DC23A5D5FF00FFFF00FFFF00FFFF00FFFF00FF1696CB
        72CBE696FEFF77F6FF78F3FF77F2FF76F2FF76F0FF77F0FF7DF3FF5AD3F2199A
        D0FF00FFFF00FFFF00FFFF00FF1696CB1696CB95EBF878F8FF78F3FF77F2FF75
        F0FF74EEFE72EDFE73EDFF5CD5F33CBBE3FF00FFFF00FFFF00FFFF00FF1696CB
        60DDF01696CB87FEFF74F4FF75F3FF73F0FF74EEFE72EDFE73EDFF57D3F25ED8
        F3189CCFFF00FFFF00FFFF00FF1696CB7AF7FC1696CB92E2F292EBF88EEDFA8A
        F4FF73EFFF70EDFE73EDFF55CFEF0159043EBFE3FF00FFFF00FFFF00FF1696CB
        86FEFF6CEEFA1696CB1696CB1696CB1696CB9AEEFA77F0FF6EEEFF01590441E0
        730159040F92CAFF00FFFF00FF1696CB82FBFF7EFAFF7DFAFF7DF8FF77F4FF51
        D4EF1696CB88DAF001590436CB5F2DC5511CB035015904FF00FFFF00FF1696CB
        83FCFF7BF8FF79F6FF78F3FF79F4FF7AF7FF6AEAFC1696CB1696CB0A73121CB0
        330A80131F9ACFFF00FFFF00FF1696CB8EFFFF7BFBFF79F7FF7AF6FF76E7F877
        E6F87DE9FB7EEDFC82F0FF04670A0C9A18036906FF00FFFF00FFFF00FF1392CA
        1696CB87F2FA88F4FC6CE3F61899CE1392CA1696CB1797CC1D9CCF04770A0589
        0CFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF1696CB1C99CE1898CCFF00FFFF
        00FFFF00FFFF00FF036F07058A0C036706FF00FFFF00FFFF00FFFF00FFFF00FF
        FF00FFFF00FFFF00FFFF00FFFF00FF015603035E06046F0A037308025F05FF00
        FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF
        00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FFFF00FF}
      ParentShowHint = False
      ShowHint = True
      OnClick = SpbBancoClick
    end
    object lbl1: TLabel
      Left = 99
      Top = 67
      Width = 40
      Height = 14
      Caption = 'Tabela:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object shp1: TShape
      Left = 8
      Top = 130
      Width = 554
      Height = 1
    end
    object Label3: TLabel
      Left = 84
      Top = 89
      Width = 55
      Height = 14
      Caption = 'Salvar Em:'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentFont = False
    end
    object lblCaminho: TLabel
      Left = 144
      Top = 89
      Width = 14
      Height = 14
      Caption = 'C:\'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = [fsBold]
      ParentFont = False
      OnClick = lblCaminhoClick
      OnMouseMove = lblCaminhoMouseMove
      OnMouseLeave = lblCaminhoMouseLeave
    end
    object BibConfirmar: TBitBtn
      Left = 440
      Top = 80
      Width = 122
      Height = 24
      Hint = 'Gerar Arquivo'
      Caption = '&Gerar Arquivo'
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      Glyph.Data = {
        E6000000424DE60000000000000076000000280000000F0000000E0000000100
        04000000000070000000C40E0000C40E00001000000000000000000000000000
        8000008000000080800080000000800080008080000080808000C0C0C0000000
        FF0000FF000000FFFF00FF000000FF00FF00FFFF0000FFFFFF00888888888888
        8880888F28888888888088F22288888888808F22222888888880F22222228888
        8880F222F22228888880F22FFF222288888088888FF2222888808888888F2222
        88808888888FF222288088888888FF2222808888888888FFFF80888888888888
        88808888888888888880}
      ModalResult = 1
      ParentFont = False
      ParentShowHint = False
      ShowHint = True
      TabOrder = 2
      OnClick = BibConfirmarClick
    end
    object TxtBDAtu: TText
      Left = 143
      Top = 40
      Width = 394
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 0
      CampoObrigatorio = False
      EnterToTab = True
      Direcionais = True
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
    object txtTabela: TText
      Left = 143
      Top = 64
      Width = 122
      Height = 20
      Ctl3D = False
      Font.Charset = DEFAULT_CHARSET
      Font.Color = clWindowText
      Font.Height = -12
      Font.Name = 'Calibri'
      Font.Style = []
      MaxLength = 12
      ParentCtl3D = False
      ParentFont = False
      TabOrder = 1
      CampoObrigatorio = False
      EnterToTab = True
      Direcionais = True
      ColorTextOnFocus = cl3DLight
      ColorTextNotFocus = clWhite
      ColorFontOnFocus = clBlack
      ColorFontNotFocus = clBlack
    end
  end
  object OpdBase1: TOpenDialog
    Filter = 
      'Arquivos de Base (*.GDB, *.FDB)|*.GDB;*.FDB|Arquivos GDB (*.GDB)' +
      '|*.GDB|Arquivos FDB (*.FDB)|*.FDB'
    Left = 23
    Top = 201
  end
  object QryMaster: TIBQuery
    Database = IdbTab1
    Transaction = ItrBD1
    BufferChunks = 1000
    CachedUpdates = False
    ParamCheck = True
    Left = 20
    Top = 256
  end
  object ItrBD1: TIBTransaction
    DefaultDatabase = IdbTab1
    Left = 73
    Top = 256
  end
  object IdbTab1: TIBDatabase
    Params.Strings = (
      'lc_ctype=WIN1252'
      'user_name=SYSDBA'
      'password=masterkey')
    LoginPrompt = False
    DefaultTransaction = ItrBD1
    ServerType = 'IBServer'
    AllowStreamedConnected = False
    Left = 75
    Top = 201
  end
  object DasGeral: TDataSource
    Left = 127
    Top = 201
  end
end
