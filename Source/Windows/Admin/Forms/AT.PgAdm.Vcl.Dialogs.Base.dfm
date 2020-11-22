object dlgBase: TdlgBase
  Left = 0
  Top = 0
  BorderStyle = bsDialog
  Caption = 'Dialog'
  ClientHeight = 263
  ClientWidth = 357
  Color = clBtnFace
  Font.Charset = DEFAULT_CHARSET
  Font.Color = clWindowText
  Font.Height = -11
  Font.Name = 'Tahoma'
  Font.Style = []
  OldCreateOrder = False
  Position = poMainFormCenter
  Visible = True
  PixelsPerInch = 96
  TextHeight = 13
  object layDialog: TdxLayoutControl
    Left = 0
    Top = 0
    Width = 357
    Height = 263
    Align = alClient
    TabOrder = 0
    LayoutLookAndFeel = dmImages.laylfsMain
    object btnOK: TcxButton
      Left = 189
      Top = 228
      Width = 75
      Height = 25
      Caption = 'OK'
      TabOrder = 0
    end
    object btnCancel: TcxButton
      Left = 272
      Top = 228
      Width = 75
      Height = 25
      Caption = 'Cancel'
      TabOrder = 1
    end
    object laygrpDialog_Root: TdxLayoutGroup
      AlignHorz = ahClient
      AlignVert = avClient
      ButtonOptions.Buttons = <>
      Hidden = True
      ShowBorder = False
      Index = -1
    end
    object laygrpDlgContent: TdxLayoutGroup
      Parent = laygrpDialog_Root
      AlignVert = avClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      Offsets.Bottom = 16
      ButtonOptions.Buttons = <>
      Padding.AssignedValues = [lpavBottom]
      ShowBorder = False
      Index = 0
    end
    object laygrpDlgButtons: TdxLayoutGroup
      Parent = laygrpDialog_Root
      AlignHorz = ahClient
      CaptionOptions.Text = 'New Group'
      CaptionOptions.Visible = False
      ButtonOptions.Buttons = <>
      LayoutDirection = ldHorizontal
      ShowBorder = False
      Index = 1
    end
    object layitmOKButton: TdxLayoutItem
      Parent = laygrpDlgButtons
      AlignHorz = ahRight
      Offsets.Left = 8
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnOK
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 0
    end
    object layitmCancelButton: TdxLayoutItem
      Parent = laygrpDlgButtons
      AlignHorz = ahRight
      Offsets.Left = 8
      CaptionOptions.Text = 'New Item'
      CaptionOptions.Visible = False
      Control = btnCancel
      ControlOptions.OriginalHeight = 25
      ControlOptions.OriginalWidth = 75
      ControlOptions.ShowBorder = False
      Index = 1
    end
  end
end
