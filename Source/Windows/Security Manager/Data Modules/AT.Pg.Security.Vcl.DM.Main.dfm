object dmMain: TdmMain
  OldCreateOrder = False
  Height = 560
  Width = 647
  object secmgrMain: TuilSecurityManager
    UserBindary.DataSource = dsUsers
    UserBindary.UserNameField = 'USER_NAME'
    UserBindary.FullNameField = 'DISPLAY_NAME'
    UserBindary.PasswordField = 'PASSWORD'
    UserBindary.AccessCountField = 'ACCESS_COUNT'
    UserBindary.CreatedDateField = 'CREATED_DATE'
    UserBindary.CreatedTimeField = 'CREATED_TIME'
    UserBindary.EnabledField = 'ACTIVE'
    UserBindary.LastAccessField = 'LASTACCESS_DATE'
    UserBindary.LastAccessTimeField = 'LASTACCESS_TIME'
    UserBindary.UserPermissions.DataSource = dsUserPerms
    UserBindary.UserPermissions.PermissionField = 'PERMISSION'
    UserBindary.UserPermissions.UserNameField = 'USER_NAME'
    GroupBindary.DataSource = dsGroups
    GroupBindary.GroupNameField = 'GROUP_NAME'
    GroupBindary.GroupDescriptionField = 'DESCRIPTION'
    GroupBindary.GroupPermissions.DataSource = dsGroupPerms
    GroupBindary.GroupPermissions.PermissionField = 'PERMISSION'
    GroupBindary.GroupPermissions.GroupNameField = 'GROUP_NAME'
    GroupBindary.GroupMembershipBindary.DataSource = dsGroupUsers
    GroupBindary.GroupMembershipBindary.GroupNameField = 'GROUP_NAME'
    GroupBindary.GroupMembershipBindary.UserNameField = 'USER_NAME'
    PermissionBindary.DataSource = dsPermissions
    PermissionBindary.PermissionField = 'PERMISSION'
    PermissionBindary.ActionField = 'ACTION'
    PermissionBindary.ItemField = 'ITEMS'
    PermissionBindary.FormNameField = 'FORMNAME'
    PermissionBindary.Storage = psForm
    Version = '3.3.0.0'
    OnFailedLoginDetail = FailedLoginDetailHandler
    OnSuccessfulLogin = SuccessfulLoginHandler
    OnDisabledLogin = DisabledLoginHandler
    Left = 124
    Top = 107
  end
  object conMain: TUniConnection
    ProviderName = 'InterBase'
    Port = 3350
    SpecificOptions.Strings = (
      'InterBase.TrustedAuthentication=True'
      'InterBase.UseUnicode=True')
    LoginPrompt = False
    Left = 216
    Top = 107
  end
  object provibMain: TInterBaseUniProvider
    Left = 216
    Top = 47
  end
  object tblPermissions: TUniTable
    TableName = 'PERMISSIONS'
    Connection = conMain
    OnDeleteError = PermsDeleteErrorHandler
    Left = 32
    Top = 227
    object fldPermissionsPERMISSION: TWideStringField
      FieldName = 'PERMISSION'
      Required = True
      Size = 80
    end
    object fldPermissionsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
    object fldPermissionsITEMS: TBlobField
      FieldName = 'ITEMS'
    end
    object fldPermissionsACTION: TIntegerField
      FieldName = 'ACTION'
    end
    object fldPermissionsFORMNAME: TWideStringField
      FieldName = 'FORMNAME'
      Size = 128
    end
  end
  object dsPermissions: TUniDataSource
    DataSet = tblPermissions
    Left = 308
    Top = 167
  end
  object tblGroups: TUniTable
    TableName = 'GROUPS'
    Connection = conMain
    OnDeleteError = GroupsDeleteErrorHandler
    Left = 124
    Top = 227
    object fldGroupsGROUP_NAME: TWideStringField
      FieldName = 'GROUP_NAME'
      Required = True
      Size = 60
    end
    object fldGroupsDESCRIPTION: TWideStringField
      FieldName = 'DESCRIPTION'
      Size = 128
    end
  end
  object dsGroups: TUniDataSource
    DataSet = tblGroups
    Left = 216
    Top = 167
  end
  object tblGroupPerms: TUniTable
    TableName = 'GROUP_PERMISSIONS'
    Connection = conMain
    OnDeleteError = GroupPermsDeleteErrorHandler
    Left = 32
    Top = 287
    object fldGroupPermsGROUP_NAME: TWideStringField
      FieldName = 'GROUP_NAME'
      Required = True
      Size = 60
    end
    object fldGroupPermsPERMISSION: TWideStringField
      FieldName = 'PERMISSION'
      Required = True
      Size = 80
    end
  end
  object dsGroupPerms: TUniDataSource
    DataSet = tblGroupPerms
    Left = 124
    Top = 167
  end
  object tblUsers: TUniTable
    TableName = 'USERS'
    Encryption.Fields = 'PASSWORD'
    Encryption.Encryptor = encUsers
    Connection = conMain
    OnDeleteError = UsersDeleteErrorHandler
    Left = 400
    Top = 227
    object fldUsersUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Required = True
      Size = 40
    end
    object fldUsersPASSWORD: TBlobField
      FieldName = 'PASSWORD'
      Required = True
    end
    object fldUsersDISPLAY_NAME: TWideStringField
      FieldName = 'DISPLAY_NAME'
      Size = 80
    end
    object fldUsersACCESS_COUNT: TLargeintField
      FieldName = 'ACCESS_COUNT'
      Required = True
    end
    object fldUsersLASTACCESS_DATE: TDateField
      FieldName = 'LASTACCESS_DATE'
    end
    object fldUsersLASTACCESS_TIME: TTimeField
      FieldName = 'LASTACCESS_TIME'
    end
    object fldUsersCREATED_DATE: TDateField
      FieldName = 'CREATED_DATE'
    end
    object fldUsersCREATED_TIME: TTimeField
      FieldName = 'CREATED_TIME'
    end
    object fldUsersACTIVE: TBooleanField
      FieldName = 'ACTIVE'
      Required = True
    end
  end
  object dsUsers: TUniDataSource
    DataSet = tblUsers
    Left = 32
    Top = 167
  end
  object encUsers: TUniEncryptor
    Left = 400
    Top = 167
    EncryptedPassword = 'AFFFBEFFACFFACFFA8FFB0FFADFFBBFF'
  end
  object tblUserPerms: TUniTable
    TableName = 'USER_PERMISSIONS'
    Connection = conMain
    OnDeleteError = UserPermsDeleteErrorHandler
    Left = 216
    Top = 227
    object fldUserPermsUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Required = True
      Size = 40
    end
    object fldUserPermsPERMISSION: TWideStringField
      FieldName = 'PERMISSION'
      Required = True
      Size = 80
    end
  end
  object dsUserPerms: TUniDataSource
    DataSet = tblUserPerms
    Left = 308
    Top = 107
  end
  object tblGroupUsers: TUniTable
    TableName = 'GROUP_USERS'
    Connection = conMain
    OnDeleteError = GroupUsersDeleteErrorHandler
    Left = 308
    Top = 227
    object fldGroupUsersGROUP_NAME: TWideStringField
      FieldName = 'GROUP_NAME'
      Required = True
      Size = 60
    end
    object fldGroupUsersUSER_NAME: TWideStringField
      FieldName = 'USER_NAME'
      Required = True
      Size = 40
    end
  end
  object dsGroupUsers: TUniDataSource
    DataSet = tblGroupUsers
    Left = 400
    Top = 107
  end
  object dlgSecurity: TuilSecurityDlg
    FormCaption = 'Users and Permissions Management'
    UsersCaption = 'Users'
    GroupsCaption = 'Groups'
    CloseBtnCaption = 'Close'
    MembershipCaption = 'Membership'
    AddUserBtnCaption = 'Add User...'
    EditUserBtnCaption = 'Edit User...'
    AddGroupBtnCaption = 'Add Group...'
    EditGroupBtnCaption = 'Edit Group...'
    RemoveUserBtnCaption = 'Delete User'
    RemoveGroupBtnCaption = 'Delete Group'
    RemoveMembershipBtnCaption = 'Remove'
    AddUserBtnHint = 'Add a user to the system.'
    EditUserBtnHint = 'Change the configuration of the selected user.'
    AddGroupBtnHint = 'Add a group to the system.'
    EditGroupBtnHint = 'Change the name and description of the selected group.'
    SecurityManager = secmgrMain
    RegistryKey = 'Software\tmssoftware\Security System'
    SaveToRegistry = False
    EditUserTitleCaption = 'Edit User'
    AddUserTitleCaption = 'Add User'
    PasswordCaption = '&Password'
    VerifyPasswordCaption = '&Verify Password'
    FullNameCaption = '&Full Name'
    UsernameCaption = '&Username'
    AccessCountCaption = 'Access count:'
    CreatedDateCaption = 'Created Date: '
    LastAccesCaption = 'Last Access:'
    EnabledCaption = 'Enabled'
    EditGroupTitleCaption = 'Edit Group'
    AddGroupTitleCaption = 'Add Group'
    GroupDescriptionCaption = 'Group &Description'
    GroupNameCaption = 'Group &Name'
    OKButtonCaption = 'OK'
    CancelButtonCaption = 'Cancel'
    DeleteUserHint = 'Remove selected user.'
    DeleteGroupHint = 'Remove selected group.'
    RemovePermissionsBtnHint = 'Remove selected user from group.'
    AddUserPopUpCaption = 'Add User...'
    EditUserPopUpCaption = 'Edit User...'
    DeleteUserPopUpCaption = 'Delete'
    AddGroupPopUpCaption = 'Add Group...'
    EditGroupPopUpCaption = 'Edit Group'
    DeleteGroupPopUpCaption = 'Delete'
    CopyPermissionsPopUpCaption = '&Copy Permissions'
    PastePermissionsPopUpCaption = '&Paste Permissions'
    UsersPageUsersTreeViewCaption = '&Users:'
    UsersPagePermissionsTreeViewCaption = '&Permissions:'
    GroupsPageGroupsTreeViewCaption = '&Groups:'
    GroupsPagePermissionsTreeViewCaption = 'P&ermissions:'
    MembershipPageGroupsTreeViewCaption = 'G&roups:'
    MembershipPageUsersTreeViewCaption = 'U&sers:'
    PasswordsNotMatchMessage = 'Passwords do not match'
    ConfirmDeleteMessage = 'Are you sure you want to delete'
    FromMessage = 'from'
    ButtonColor = 12091981
    ButtonColorDown = 9003321
    ButtonColorHover = 14528642
    ButtonColorDisabled = clSilver
    ButtonTextColor = clWhite
    ButtonTextColorDown = clWhite
    ButtonTextColorHover = clWhite
    ButtonTextColorDisabled = clMedGray
    Left = 32
    Top = 107
  end
  object dlgLogin: TuilLoginDlg
    SecurityManager = secmgrMain
    TitleCaption = 'Login'
    UsernameCaption = '&Username'
    PasswordCaption = '&Password'
    LoginButtonCaption = 'Login'
    CancelButtonCaption = 'Cancel'
    ButtonColor = 12091981
    ButtonColorDown = 9003321
    ButtonColorHover = 14528642
    ButtonColorDisabled = clSilver
    ButtonTextColor = clWhite
    ButtonTextColorDown = clWhite
    ButtonTextColorHover = clWhite
    ButtonTextColorDisabled = clMedGray
    Left = 400
    Top = 47
  end
end
