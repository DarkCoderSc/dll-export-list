object FrmMain: TFrmMain
  Left = 0
  Top = 0
  Caption = 'DLL Export Enum'
  ClientHeight = 294
  ClientWidth = 632
  Color = clWhite
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  Menu = MainMenu1
  OldCreateOrder = False
  Position = poScreenCenter
  OnCreate = FormCreate
  PixelsPerInch = 96
  TextHeight = 13
  object lstview: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 626
    Height = 269
    Align = alClient
    Columns = <
      item
        Caption = 'Function Name'
        Width = 150
      end
      item
        Caption = 'Address'
        Width = 150
      end
      item
        Caption = 'Relative Address'
        Width = 150
      end
      item
        Caption = 'Ordinal'
        Width = 100
      end>
    DoubleBuffered = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    ShowWorkAreas = True
    SmallImages = Img16
    TabOrder = 0
    ViewStyle = vsReport
    OnCustomDrawItem = lstviewCustomDrawItem
  end
  object status: TStatusBar
    Left = 0
    Top = 275
    Width = 632
    Height = 19
    Panels = <
      item
        Width = 200
      end
      item
        Width = 50
      end>
  end
  object Img16: TImageList
    ColorDepth = cd32Bit
    DrawingStyle = dsTransparent
    Left = 248
    Top = 112
    Bitmap = {
      494C010101000800040010001000FFFFFFFF2110FFFFFFFFFFFFFFFF424D3600
      0000000000003600000028000000400000001000000001002000000000000010
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000000000000190E
      01614325029F0000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000001A0E0165B06B
      16FCBB7A2AFD482803A500000003000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636FE363636FE4C3E2CFDAB6107FED9AE
      6DFDE6C189FDBC7D2EFD4A2A03A8000000040000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636FE000000000000000023140176B46F
      1BFDE1BB7FFDE6C28AFDBB7A2AFD492903A70000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636FE0000000000000000000000002213
      0172B36E1AFDD5A863FDAA6511F9120A00530000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636FE0000000000000000000000000000
      00002012016FA45B06F71009004F000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000363636FE0000000000000000000000000000
      0000000000020201001F00000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000000000000002081046102F
      5FA6000000060000000000000000363636FE0000000000000000000000002A15
      2A853F1F3FA30000000300000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000003091249286FD4F6408C
      E3FD12366DB20000000600000000363636FE00000000000000002211227AA55F
      A7FDAA6BACFD452345AA00000005000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000030A134C2A70D6F773BEEDFD88D2
      F0FD4793E5FD2A5EAEFD35373BFD363636FE363636FE483A48FD9A4F9BFEC6A1
      CBFDD1B4D7FDAC6EAEFD4A254AB0000000060000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000E2B579E3D88E3FD86D0F0FD8AD4
      F1FD88D2F0FD4894E5FD14386DB8000000080000000000000000190D1969A059
      A1FCCBA9D0FDD1B4D7FDAA6AACFD482448AE0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000000000020F2D59A03F8BE3FD85CF
      F0FD8AD4F1FD88D2F0FD4995E5FD143C78BA0000000A0000000000000000180C
      19669F59A1FCBE92C2FD944E95F60C060C480000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00000000000000000000000000000000000000000000000000020E2A559D3E8A
      E3FD85CFF0FD8AD4F1FD89D3F0FD4692E4FD143D7BBC00000002000000000000
      0000160B16628C468DF20B050B45000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000010D28
      51993E89E3FD84CEF0FD79C4EEFD2F78DCFB0510206100000000000000000000
      0000000000000100011600000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      00010C274E963B86E2FD2E77DCFB050F1D5D0000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000B23468F040E1B5A000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000000000000000000000000000424D3E000000000000003E000000
      2800000040000000100000000100010000000000800000000000000000000000
      000000000000000000000000FFFFFF0000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      0000000000000000000000000000000000000000000000000000000000000000
      000000000000}
  end
  object MainMenu1: TMainMenu
    Left = 392
    Top = 120
    object File1: TMenuItem
      Caption = 'File'
      object LoadFile1: TMenuItem
        Caption = 'Load File'
        OnClick = LoadFile1Click
      end
      object LoadProcess1: TMenuItem
        Caption = 'Load Process'
        OnClick = LoadProcess1Click
      end
      object N1: TMenuItem
        Caption = '-'
      end
      object Exit1: TMenuItem
        Caption = 'Exit'
        OnClick = Exit1Click
      end
    end
    object Export1: TMenuItem
      Caption = 'List'
      object Clear1: TMenuItem
        Caption = 'Clear'
        OnClick = Clear1Click
      end
      object Export2: TMenuItem
        Caption = 'Export'
        OnClick = Export2Click
      end
    end
    object About1: TMenuItem
      Caption = 'About'
      OnClick = About1Click
    end
  end
  object OD: TOpenDialog
    Left = 128
    Top = 104
  end
  object SD: TSaveDialog
    DefaultExt = 'txt'
    Left = 336
    Top = 184
  end
  object Timer: TTimer
    Interval = 1
    Left = 496
    Top = 168
  end
end