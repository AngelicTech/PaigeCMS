object dmMain: TdmMain
  OldCreateOrder = False
  OnCreate = DataModuleCreate
  Height = 271
  Width = 573
  object alstApp: TActionList
    Images = dmImages.vilSmallColor
    Left = 16
    Top = 19
    object actAppExit: TFileExit
      Category = 'Application'
      Caption = 'Exit Spre@dsheets'
      Hint = 'Exit Spre@dsheets|Quits the Spre@dsheets application'
      ImageIndex = 1
      ShortCut = 32856
    end
    object actFileOpen: TFileOpen
      Category = 'File'
      Caption = 'Open'
      Dialog.DefaultExt = 'pdf'
      Dialog.Filter = 
        'Re@der Files (*.pdf;*.doc;*.docx;*.rtf;*.txt;*.bmp;*.jpg;*.jpeg;' +
        '*.png;*.wmf;*.emf;*.tif;*.tiff)|*.pdf;*.doc;*.docx;*.rtf;*.txt;*' +
        '.bmp;*.jpg;*.jpeg;*.png;*.wmf;*.emf;*.tif;*.tiff|PDF Files (*.pd' +
        'f)|*.pdf|Word Processing Documents (*.doc;*.docx;*.rtf)|*.doc;*.' +
        'docx;*.rtf|Rich Text Documents (*.rtf)|*.rtf|Text Files (*.txt)|' +
        '*.txt|Word Documents (*.doc;*.docx)|*.doc;*.docx|Image Files (*.' +
        'bmp;*.jpg;*.jpeg;*.png;*.wmf;*.emf;*.tif;*.tiff)|*.bmp;*.jpg;*.j' +
        'peg;*.png;*.wmf;*.emf;*.tif;*.tiff|Bitmap Images (*.bmp)|*.bmp|E' +
        'nhanced Metafile (*.emf)|*.emf|JPEG Images (*.jpg;*.jpeg)|*.jpg;' +
        '*.jpeg|PNG Images (*.png)|*.png|TIFF Images (*.tif;*.tiff)|*.tif' +
        ';*.tiff|Windows Metafile (*.wmf)|*.wmf|All Files (*.*)|*.*'
      Dialog.FilterIndex = 0
      Dialog.Options = [ofHideReadOnly, ofPathMustExist, ofFileMustExist, ofEnableSizing]
      Dialog.Title = 'Open Document'
      Hint = 'Open|Loads an existing document.'
      ImageIndex = 6
      ShortCut = 16463
      OnAccept = FileOpenActionAccepted
    end
    object actAppSettings: TAction
      Category = 'Application'
      Caption = 'Settings'
      Hint = 'Settings|Allows you to change application-wide settings.'
      ImageIndex = 2
      ImageName = 'AppSettings'
    end
    object actCapsLock: TAction
      Category = 'Key State'
      Caption = 'Caps'
      OnExecute = ExecuteCapsLockAction
      OnUpdate = UpdateCapsLockAction
    end
    object actNumLock: TAction
      Category = 'Key State'
      Caption = 'Num'
      OnExecute = ExecuteNumLockAction
      OnUpdate = UpdateNumLockAction
    end
    object actScrollLock: TAction
      Category = 'Key State'
      Caption = 'Scrl'
      OnExecute = ExecuteScrollLockAction
      OnUpdate = UpdateScrollLockAction
    end
    object actHelpContents: TAction
      Caption = 'Spre@dsheets Help'
      ImageIndex = 26
      ImageName = 'Help'
      ShortCut = 112
    end
    object actAppAbout: TAction
      Caption = 'About Spre@dsheets'
      ImageIndex = 32
      ImageName = 'About'
    end
    object actATWebsite: TAction
      Caption = 'Angelic Technology Website'
      ImageIndex = 27
      ImageName = 'ATWebsite'
      OnExecute = ExecuteATWebsiteAction
    end
    object actPeerForum: TAction
      Caption = 'Peer Support Forum'
      ImageIndex = 28
      ImageName = 'PeerForum'
      OnExecute = ExecutePeerForumAction
    end
    object actTechSupport: TAction
      Caption = 'Technical Support'
      ImageIndex = 29
      ImageName = 'TechSupport'
      OnExecute = ExecuteTechSupportAction
    end
  end
  object aeMain: TApplicationEvents
    OnIdle = AppIdleHandler
    Left = 272
    Top = 120
  end
end
