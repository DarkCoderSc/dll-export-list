object FrmProcess: TFrmProcess
  Left = 0
  Top = 0
  Caption = 'Process List'
  ClientHeight = 332
  ClientWidth = 579
  Color = clWhite
  DoubleBuffered = True
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poOwnerFormCenter
  OnShow = FormShow
  PixelsPerInch = 96
  TextHeight = 13
  object Splitter1: TSplitter
    Left = 0
    Top = 154
    Width = 579
    Height = 3
    Cursor = crVSplit
    Align = alBottom
    ResizeStyle = rsUpdate
    ExplicitTop = 0
    ExplicitWidth = 157
  end
  object lstprocess: TListView
    AlignWithMargins = True
    Left = 3
    Top = 3
    Width = 573
    Height = 148
    Align = alClient
    Columns = <
      item
        AutoSize = True
        Caption = 'Process Name'
      end
      item
        Caption = 'Process ID'
        Width = 150
      end>
    DoubleBuffered = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    ShowWorkAreas = True
    TabOrder = 0
    ViewStyle = vsReport
    OnClick = lstprocessClick
    OnCustomDrawItem = lstprocessCustomDrawItem
    ExplicitLeft = -2
    ExplicitTop = -2
    ExplicitHeight = 326
  end
  object lstmodules: TListView
    AlignWithMargins = True
    Left = 3
    Top = 160
    Width = 573
    Height = 169
    Align = alBottom
    Columns = <
      item
        AutoSize = True
        Caption = 'DLL Path'
      end>
    DoubleBuffered = True
    ReadOnly = True
    RowSelect = True
    ParentDoubleBuffered = False
    PopupMenu = popmodules
    ShowWorkAreas = True
    TabOrder = 1
    ViewStyle = vsReport
    OnCustomDrawItem = lstmodulesCustomDrawItem
    OnDblClick = lstmodulesDblClick
  end
  object popmodules: TPopupMenu
    Left = 272
    Top = 240
    object ShowDLLExports1: TMenuItem
      Caption = 'Show DLL Exports'
      OnClick = ShowDLLExports1Click
    end
  end
end
