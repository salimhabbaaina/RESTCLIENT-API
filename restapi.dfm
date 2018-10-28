object Form2: TForm2
  Left = 0
  Top = 0
  Caption = 'Form2'
  ClientHeight = 552
  ClientWidth = 898
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  PixelsPerInch = 96
  TextHeight = 13
  object Button1: TButton
    Left = 348
    Top = 172
    Width = 75
    Height = 25
    Caption = 'Envoyer'
    TabOrder = 0
    OnClick = Button1Click
  end
  object Edit1: TEdit
    Left = 39
    Top = 174
    Width = 266
    Height = 21
    MaxLength = 30
    TabOrder = 1
  end
  object Button2: TButton
    Left = 96
    Top = 280
    Width = 75
    Height = 25
    Caption = 'OPEN'
    TabOrder = 2
    OnClick = Button2Click
  end
  object RESTClient1: TRESTClient
    Accept = 'text/html,application/xhtml+xml,application/xml;q=0.9,*/*;q=0.8'
    BaseURL = 'http://localhost/salim/public/server'
    Params = <>
    HandleRedirects = True
    Left = 12
    Top = 5
  end
  object RESTRequest1: TRESTRequest
    Client = RESTClient1
    Method = rmPOST
    Params = <
      item
        name = 'NAME'
      end>
    Resource = 'postsalim'
    Response = RESTResponse1
    SynchronizedEvents = False
    Left = 92
    Top = 5
  end
  object RESTResponse1: TRESTResponse
    Left = 188
    Top = 6
  end
end
