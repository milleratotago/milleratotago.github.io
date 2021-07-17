Echo on

Rem Note: This file does not update software downloads
Rem (which must be in Zip files not exe files).

Rem 2021-01:
Rem This file can be run from lab machines connected to
Rem psych network; needs wmount.bat and dirc.exe.

call Wmount 1
goto :AutoRun

REM Directions for updating my web page from Windows XP.  (Now Win 7, 10)
REM Command file to copy updates to server from Windows.

REM Before starting, connect drive W: to mab:
REM 2013-05:
REM Just run the batch file binw\jbat\Wmount.bat
REM   Open "My computer" and select "Map network drive"
REM   Choose drive W: and enter "Folder" as \\psychweb-v2\miller
REM   Tick "Connect using different credentials"
REM   username & password are psychweb-v2\jeff & updatemiller
Pause

:AutoRun
REM Run this batch file
REM
Echo on
REM cd W:\public_html
dirc *.* W:. copy1 newer1
dirc pubs\*.* W:pubs copy1 newer1
dirc progs\*.* W:progs copy1 newer1
pause

dirc presentations\*.* W:presentations copy1 newer1
dirc pubs\*.htm W:pubs del2 only2
dirc progs\*.htm W:progs del2 only2
dirc presentations\*.* W:presentations del2 only2
pause

dirc pubs\*.* W:pubs copy1 only1
dirc progs\*.* W:progs copy1 only1
dirc presentations\*.* W:presentations copy1 only1
pause

REM May need to set permissions to let everyone read the new files,
REM although I think this has now been done at the folder level.
REM It can be done in Windows via right click, properties, security.
REM July 2005: Had to manually set permission for FitDist.htm
REM Feb 2006: Added new files but did not need to set permissions.

dirc @mysoft.txt copy1 newer1 only1
REM Take care of some case problems:
rem w:progs\RMITest.exe rmitest2.exe
rem w:progs\rmitest2.exe rmitest.exe

REM The following files are NOT ON THE SERVER:
dirc \text\html\jom\*.* W:. list1 only1 /r
Pause

REM The following files are OLDER ON THE SERVER:
dirc \text\html\jom\*.* W:. list1 newer1 /r
Pause

Rem Continue to dismount W, otherwise break.
pause
call Wmount 0


