!define setup "Firefox-GPO.exe"
!define prodname "Firefox GPO Extension"
!define regkey "Software\${prodname}"
!define version "1.0"
!define uninstkey "Software\Microsoft\Windows\CurrentVersion\Uninstall\${prodname}-${version}"
!define uninstaller "uninstall-gpo.exe"

XPStyle on
ShowInstDetails hide
ShowUninstDetails hide
 
Name "${prodname}"
Caption "${prodname}"
 
OutFile "${setup}"
 
SetDateSave on
SetDatablockOptimize on
CRCCheck on
SilentInstall normal
 
InstallDir "C:\Program Files\Mozilla Firefox\"
InstallDirRegKey HKLM "${regkey}" ""

Page directory
Page instfiles
 
UninstPage uninstConfirm
UninstPage instfiles
 
AutoCloseWindow false
ShowInstDetails show
 

Section
 
  WriteRegStr HKLM "${uninstkey}" "DisplayName" "${prodname}"
  WriteRegStr HKLM "${uninstkey}" "UninstallString" '"$INSTDIR\${uninstaller}"'
  SetOutPath $INSTDIR
  File "mozilla-gp.cfg"
  SetOutPath $INSTDIR\defaults\pref
  File "local-settings.js"
  SetOutPath $INSTDIR
  WriteUninstaller "${uninstaller}"
 
SectionEnd
 
; Uninstaller
; ; All section names prefixed by "Un" will be in the uninstaller
;  
UninstallText "This will uninstall ${prodname}."
   
Section "Uninstall"

  Delete "$INSTDIR\mozilla-gp.cfg"
  Delete "$INSTDIR\defaults\pref\local-settings.js"
  DeleteRegKey HKLM "${uninstkey}"
  DeleteRegKey HKLM "${regkey}"
                
SectionEnd
