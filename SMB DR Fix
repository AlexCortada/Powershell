#this script enables the Windows Feature for SMB1 and 2, sets the reg entries to force enable, then disables the outdated or depracated features, leaving the correct ones
#which are SMB v2.

Enable-WindowsOptionalFeature -Online -FeatureName SMB1Protocol

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB1 -Type DWORD -Value 1 -Force

Set-ItemProperty -Path "HKLM:\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters" SMB2 -Type DWORD -Value 1 -Force

sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi
sc.exe config mrxsmb10 start= auto
sc.exe config lanmanworkstation depend= bowser/mrxsmb10/mrxsmb20/nsi
sc.exe config mrxsmb20 start= auto


DISM /online /disable-feature /featurename:SMB1Protocol-Client
DISM /online /disable-feature /featurename:SMB1Protocol-Server
DISM /online /disable-feature /featurename:SMB1Protocol-Deprecation
DISM /online /disable-feature /featurename:SMB1Protocol
DISM /online /enable-feature /featurename:SmbDirect

REG ADD HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /v "SMB1" /t REG_DWORD /d 0x00000000 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /v "SMB2" /t REG_DWORD /d 0x00000001 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\Services\LanmanServer\Parameters /v "DependOnService" /t REG_MULTI_SZ /d "Bowser"\0"MRxSmb20"\0"NSI"\0 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\services\mrxsmb /v "Start" /t REG_DWORD /d 0x00000003 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\services\mrxsmb10 /v "Start" /t REG_DWORD /d 0x00000004 /f
REG ADD HKLM\SYSTEM\CurrentControlSet\services\mrxsmb20 /v "Start" /t REG_DWORD /d 0x00000003 /f
REG ADD HKLM\SYSTEM\ControlSet001\services\LanmanWorkstation /v "DependOnService" /t REG_MULTI_SZ /d "Bowser"\0"MRxSmb20"\0"NSI"\0 /f
REG ADD HKLM\SYSTEM\DependOnService\services\LanmanWorkstation /v "DependOnService" /t REG_MULTI_SZ /d "Bowser"\0"MRxSmb20"\0"NSI"\0 /f
