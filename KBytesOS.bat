color 0f
title KBytesOS
set version=0.5.2
@echo off
set "Directory=UserDatas"

md "%Directory%" 2>nul
if not exist "%Directory%\*" (
    echo Failed to create directory "%Directory%"
    pause
    goto :EOF
)

set "Directory2=UserDatas\NotesData"

md "%Directory2%" 2>nul
if not exist "%Directory2%\*" (
    echo Failed to create directory "%Directory2%"
    pause
    goto :EOF
)


set "Directory3=UserDatas\stats"

md "%Directory3%" 2>nul
if not exist "%Directory3%\*" (
    echo Failed to create directory "%Directory3%"
    pause
    goto :EOF
)

set "Directory4=UserDatas\stats\slot1"

md "%Directory4%" 2>nul
if not exist "%Directory4%\*" (
    echo Failed to create directory "%Directory4%"
    pause
    goto :EOF
)

set "Directory5=UserDatas\stats\slot2"

md "%Directory5%" 2>nul
if not exist "%Directory5%\*" (
    echo Failed to create directory "%Directory5%"
    pause
    goto :EOF
)

set "Directory6=UserDatas\stats\slot3"

md "%Directory6%" 2>nul
if not exist "%Directory6%\*" (
    echo Failed to create directory "%Directory6%"
    pause
    goto :EOF
)

cls
echo KBytes.OS V%version%
echo DOS Boot Loader 0.5
echo FOUND at Dev/0.4
echo.
echo Booting Kernel...
timeout /T 2 /NOBREAK >nul
echo Booting Programs and System Files...
timeout /T 2 /NOBREAK >nul
echo Loading OS Data...
timeout /T 2 /NOBREAK >nul
echo PRESS ANY KEY TO CONTINUE...
pause >nul
goto Loading

set load=
set/a loadnum=0
:Loading
set load=%load%()
cls
echo.
echo Loading... Please Wait...
echo ------------------------------
echo %load%
echo ------------------------------
ping localhost -n 1 >nul
set/a loadnum=%loadnum% +1
if %loadnum%==15 goto Done
rem For loading thinging
goto Loading
:Done
echo Starting...
ping localhost -n 2 >nul
goto options

:options
cls
echo Choose an option:
echo.
echo 1:Register
echo 2:Login
echo.
choice /c 12 /n >nul
if %ERRORLEVEL%==1 goto register
if %ERRORLEVEL%==2 goto login

:register
cls
echo Create Account
echo.
set /p "user=Username:"
set /p "pass=Password:"

echo '%user%''%pass%'>> UserDatas\usersdata.ltxdata
goto username

:login
        cls
        echo Please Login.
        echo(
        set /p "user=Username: "
        set /p "pass=Password: "
        
        goto authenticate

:authenticate
for /f "usebackq delims=" %%a in (`type "UserDatas\usersdata.ltxdata" ^| findstr "'%user%''%pass%'"`) do (
    if "%%a"=="'%user%''%pass%'" (
       goto succ
   )
)
goto errorlogin

:errorlogin
cls
echo Invalid Username Or Password.
pause >nul
goto login

:succ
cls 
echo Login Successful
echo.
echo Loading...
ping localhost -n 2 >nul
goto menu

:menu
title -Menu- KBytesOS 
cls
echo ---------------------
echo        Menu
echo    Welcome, %user%
echo    %time% %date%
echo ---------------------
echo.
echo 1.Games
echo 2.Password Generator
echo 3.Calculator
echo 4.Notepad
echo 5.Update Log
echo 6.System Info
echo 7.Shutdown
echo.

choice /c 12345678 /n >nul
if %ERRORLEVEL%==1 goto games
if %ERRORLEVEL%==2 goto passgen
if %ERRORLEVEL%==3 goto calc
if %ERRORLEVEL%==4 goto notes
if %ERRORLEVEL%==5 goto updatelog
if %ERRORLEVEL%==6 goto info
if %ERRORLEVEL%==7 goto shutdown

:shutdown
cls
echo Bye See You Later! System Will Close...
pause
cls
echo System Is Closing
timeout /t /5 /NOBREAK 
exit


:info
title -Info- KBytesOS 
cls
echo.=======================
echo      KBYTES__OS
echo.=======================
echo     DETAILS  
echo.
echo   Last Update : 17/8/2022
echo.
echo   Size : 81.3 KB
echo.
echo   UserName : %User%
echo   Password : %pass%
echo.=======================
echo     HARDWARE INFO
echo.
echo RAM :
systeminfo | findstr /c:"Total Physical Memory"
echo.
echo CPU :
wmic cpu get name
echo.========================
echo   (C) KBytesDev 2022
echo.========================
echo.
echo Wanna check for update?

echo  1. to check for update 
echo  2. Menu

choice /c 12 /n >nul
if %ERRORLEVEL%==1 goto updatelog
if %ERRORLEVEL%==2 goto menu
 


:updatelog
title -UpdateLog- KBytesOS 
cls
echo.=======================
echo       OS_Update
echo.=======================
echo    KBYTES_OS_V_%version%
echo.
echo Version 0.5.2 - Fixed Bugs
echo.
echo Version 0.5 - Added Raise A Floppa Game,Fixed Bugs
echo.
echo Version 0.4.0/0.4.1 - Register Users,Better Notepad,UserData
echo.
echo Version 0.3.0 - Added RPG Game, Fixed Some Bugs, Auto-click Thing
echo.
echo Version 0.2.5 - Added Notepad, Fixed Some UI.
echo.
echo Version 0.2.0 - Added Start OS Loading.
echo.
echo Version 0.1.0 - Added OS And Importand Apps.
echo.
echo.========================
echo   Last Update : 2/8/2022
echo.========================
echo.
echo Press 1 To Go Back To Menu
choice /c 1 /n >nul
if %ERRORLEVEL%==1 goto menu



:calc
title -Calculator- KBytesOS
cls
echo Press 1 for Addition
echo Press 2 for Subtraction
echo Press 3 for Multiplication
echo Press 4 for Division
echo Press 5 to Menu
choice /c 12345 /n >nul
if %ERRORLEVEL%==1 goto a
if %ERRORLEVEL%==2 goto b
if %ERRORLEVEL%==3 goto c
if %ERRORLEVEL%==4 goto d
if %ERRORLEVEL%==5 goto menu
:a
echo Addition
echo Type The 2 Numbers To Add
set /p num1=
set /p num2=
echo %num1%+%num2%?
pause
set /a Answer=%num1%+%num2%
echo %Answer%
pause
goto calc
:b
echo Subtraction
echo Type The 2 Numbers To Substract
set /p num1=
set /p num2=
echo %num1%-%num2%?
pause
set /a Answer=%num1%-%num2%
echo %Answer%
pause
goto calc
:c
echo Multiplication
echo Type The 2 Numbers To Multiply
set /p num1=
set /p num2=
echo %num1%*%num2%?
pause
set /a Answer=%num1%*%num2%
echo %Answer%
pause
goto calc
:d
echo Division
echo Type The 2 Numbers To Divide
set /p num1=
set /p num2=
echo %num1%/%num2%?
pause
set /a Answer=%num1%/%num2%
echo %Answer%
pause
goto calc



:notes
title -Notepad- KBytesOS
cls
echo ________________________________________
echo.
echo             Light Notepad
echo ________________________________________
echo Current File - %name%
echo.
echo Press 1 to create a file.
echo Press 2 to edit content of the file.
echo Press 3 to select the file.
echo Press 4 to exit.

choice /c 1234 /n >nul
if %ERRORLEVEL%==1 goto creates
if %ERRORLEVEL%==2 goto writes
if %ERRORLEVEL%==3 goto selects
if %ERRORLEVEL%==4 goto menu


cls
echo *********************************
echo sorry invalid number!
echo *********************************
ping localhost -n 2 >nul
goto notes

:creates
cls
echo ________________________________________
echo.
echo          Light Notepad - Create
echo ________________________________________
echo - %name%
echo. 
echo Name Your Document .. eg. 'hello.ltxdata' or 'hello.txt'
set /p name=">"

goto notes

:writes
cls
echo ________________________________________
echo.
echo          Light Notepad - Write
echo ________________________________________
echo Current File - %name%
echo. 
echo To add another line to your text press enter .. To stop editing press the big 
echo red X in the corner of this screen. Also You can only use 5 Line for editing.
echo.
echo Cannot use symbols:"   > < |   " lol if you use any of them 3 symbols it closes!
echo.
set /p content=">"
set /p content2=">"
set /p content3=">"
set /p content4=">"
set /p content5=">"
echo %content% >> UserDatas\NotesData\%name%
echo %content2% >> UserDatas\NotesData\%name%
echo %content3% >> UserDatas\NotesData\%name%
echo %content4% >> UserDatas\NotesData\%name%
echo %content5% >> UserDatas\NotesData\%name%
cls
echo Save Successful!
ping localhost -n 2 >nul
goto notes

:selects
cls
echo ________________________________________
echo.
echo          Light Notepad - Select
echo ________________________________________
echo Current File - %name%
echo. 
echo Type in the name eg. 'hello.ltxd' or 'hello.bat'
echo.
set /p name=">"
goto notes



:games
title -Games- KBytesOS
cls
echo %time% %date%
echo.
echo *Here Some Games We have...
echo.
echo 1.Guess The Number
echo 2.RPG
echo 3.Tictactoc
echo 4.Raise A Floppa
echo 5.Menu
echo.
choice /c 12345 /n >nul
if %ERRORLEVEL%==1 goto gtn
if %ERRORLEVEL%==2 goto rpg
if %ERRORLEVEL%==3 goto tic
if %ERRORLEVEL%==4 goto rabf
if %ERRORLEVEL%==5 goto menu


:gtn
title -Guess The Number- KBytesOS
cls
set /a guessnum=0
set /a answer=%RANDOM%
set variable1=surf33
echo ----------------------------------------------------------------
echo What Number Am I Thinking Of? (Press Q To Menu)
echo.
echo ----------------------------------------------------------------
echo.
:top
echo.
set /p guess=
echo.
if %guess% == q goto games
if %guess% GTR %answer% ECHO Lower!
if %guess% LSS %answer% ECHO Higher!
if %guess%==%answer% GOTO EQUAL
set /a guessnum=%guessnum% +1
if %guess%==%variable1% ECHO Found the backdoor hey?, the answer is: %answer%
goto top
:equal
echo Congratulations, You guessed right!!!
echo.
echo It took you %guessnum% guesses.
echo.
pause
goto games



:rpg
title -RPG- KBytesOS
set ADM=FALSE
set PASSWORD=echo
call UserDatas\Settings.bat
:home
cls
echo ======================
echo    RPG Batch Game
echo ======================
echo     1. New Game
echo     2. Load Game
echo     3. Settings
echo     4. Quit
echo ======================
choice /c 1234 /n >nul
set MSG= 
if %ERRORLEVEL%==1 (
set MSG=New Game Created.
goto NEWGAME
)
if %ERRORLEVEL%==2 (
call UserDatas\GameSave.bat
set MSG=Game Loaded.
goto CHOICE
)
if %ERRORLEVEL%==3 goto SETTINGS
if %ERRORLEVEL%==4 goto games
goto home
:NEWGAME
cls
echo ==================
echo What is your name?
echo ==================
set /p NAME=
::HERO STATS
set MHP=35
set HP=%MHP%
set DMG=4
set LVL=1
set EXP=0
set MEXP=80
set GOLD=125
set DEF=0
set BLOCKt=FALSE
set MS=0
set WEP=0
set ARM=0
set HPU=0
set BOSS1=FALSE
set BOSS2=FALSE
set BOSS=FALSE
:CHOICE
if %BOSS1%==TRUE call :BOSSchk
cls
 
if %ADM%==TRUE (
                echo ======================        ADMIN:P
) else          echo ======================
		echo  Who will you battle?
                echo ======================
                echo       ( W.Save )               /$$$\
                echo.                           I===========I
                echo  1. Wolf        Lvl.1      I    (R)    I
                echo  2. Spider      Lvl.2      I   Store   I
                echo  3. Goblin      Lvl.3      I===========I
                echo  4. Knight      Lvl.4
		echo  5. Mech. Guard Lvl.6
                echo  6. Dragon      Lvl.10
                echo  7. Harpy       Lvl.15
                echo  8. Hydra       Lvl.20
                echo  9. Sephiroth   Lvl.??
                echo ======================
                echo  (Q)Stats     Menu(E)
                echo ======================
                echo ::%MSG%
choice /c 123456789qwerp /n >nul
set HP=%MHP%
set MESSAGE= 
if %ERRORLEVEL%==1 call :WOLFs
if %ERRORLEVEL%==2 call :SPIDERs
if %ERRORLEVEL%==3 call :GOBLINs
if %ERRORLEVEL%==4 call :KNIGHTs
if %ERRORLEVEL%==5 call :ROYALs
if %ERRORLEVEL%==6 call :DRAGONs
if %ERRORLEVEL%==7 call :HARPs
if %ERRORLEVEL%==8 call :HYDRAs
if %ERRORLEVEL%==9 call :OWAs
if %ERRORLEVEL%==11 (
call :SAVE
set MSG=Game Saved.
goto CHOICE
)
if %ERRORLEVEL%==12 goto home
if %ERRORLEVEL%==10 (
call :STATS
goto CHOICE
)
if %ERRORLEVEL%==13 (
call :STORE
goto CHOICE
)
if %ERRORLEVEL%==14 goto ADMIN
set MSG= 
:SCREEN
cls
if %BLOCKt%==TRUE (
 set BLOCKt==FALSE
 set /a DEF-=%LVL%
)
if %HP% LEQ 0 goto over
echo ---- Your Turn ----
echo ===================
echo %NAME% Lvl:%LVL%
echo ===================
echo Exp:%EXP%
echo %HP% / %MHP%
echo Damage:%DMG%
echo Defence:%DEF%
echo ===================        
echo                           I==============I
echo                           I   1.Attack   I
echo         Vs                I   2.Block    I
echo                           I   3.Run      I
echo                           I==============I
echo ===================
echo %eNAME% Lvl:%eLVL%
echo ===================
echo %eHP% / %eMHP%
echo Damage:%eDMG%
echo ===================
echo.
echo ::%MESSAGE%
choice /c 123 /n >nul
if %ERRORLEVEL%==1 call :ATTACK
if %ERRORLEVEL%==2 (
 set /a DEF+=%LVL%
 set /a HP+=%LVL%
 set BLOCKt=TRUE
 set MESSAGE=You prepare to block and heal for %LVL%.
)
if %ERRORLEVEL%==3 (
 set MESSAGE=Your escape failed!
 call :RUN
)
:eSCREEN
cls
if %HP% GTR %MHP% set HP=%MHP%
if %eHP% LEQ 0 goto VICTORY
echo.
echo ===================
echo %NAME% Lvl:%LVL%
echo ===================
echo Exp:%EXP%
echo %HP% / %MHP%
echo Damage:%DMG%
echo Defence:%DEF%
echo ===================
echo.
echo.
echo         Vs                
echo.                          
echo --- Their Turn ----
echo ===================
echo %eNAME% Lvl:%eLVL%
echo ===================
echo %eHP% / %eMHP%
echo Damage:%eDMG%
echo ===================
echo.
echo ::%MESSAGE%
ping localhost -n 3 >nul
:eATTACK
::DD is DAMAGE DEALT
set R=%RANDOM%
set /a R=%RANDOM% * 100 / 32768 + 1
if %R% LEQ 8 (
 set MESSAGE=%eNAME% missed!
 goto SCREEN
)
if %R% GTR 92 (
 set DD=%eCRIT%
 set /a HP-=%eADMG%
 set M=2
) else (
 set DD=%eDMG%
 set M=1
)
set /a eADMG=%DD%-%DEF%
if %eADMG% LEQ 0 set eADMG=1
set /a HP-=%eADMG%
if %M%==1 set MESSAGE=%eNAME% did %eADMG% dmg!
if %M%==2 set MESSAGE=%eNAME% critically strikes for %eADMG% dmg!
goto SCREEN
:ATTACK
set /a CRIT=%DMG%*2
set R=%RANDOM%
set /a R=%RANDOM% * 100 / 32768 + 1
if %R% LEQ 8 ( 
 set MESSAGE=You missed!
 goto eSCREEN
)
if %R% GTR 92 (
 set DD=%CRIT%
 set M=2
) else (
 set DD=%DMG%
 set M=1
)
set /a eHP-=%DD%
if %M%==1 set MESSAGE=You did %DMG% dmg!
if %M%==2 set MESSAGE=You critically strike for %CRIT% dmg!
goto:eof
:RUN
set RUN=%LVL%
set R=%RANDOM%
set /a R=%RANDOM% * 100 / 32768 + 1
if %R% GEQ %eRUN% goto ESCAPE
goto eSCREEN
:VICTORY
set BONUSg=0
set BONUSe=0
call :LOOT
set /a Ae=%eEXP%+%BONUSe%
set /a Ag=%eGOLD%+%BONUSg%
set /a GOLD+=%Ag%
set /a EXP+=%Ae%
set /a MS+=1
cls
echo ==================
echo      Victory!
echo ==================
echo  Gained %Ae% Exp
echo  Gained %Ag% Gold
echo ==================
call :LVLCHECK
pause >nul
goto CHOICE
:LVLCHECK
set LVLmark=20*%LVL%
if %EXP% GEQ %MEXP% (
 set /a EXP-=%MEXP%
 set /a MEXP+=50+%LVLmark%
 set /a LVL+=1
 set /a MHP+=15
 set /a DMG+=1
)
if %EXP% GEQ %MEXP% goto LVLCHECK
goto:eof
:ESCAPE
cls
echo ==================
echo      Escaped!
echo ==================
echo   No rewards for
echo      running.
echo ==================
pause >nul
goto CHOICE
:over
cls
echo ==================
echo     Game Over
echo ==================
echo    Your health
echo     reached 0 
echo ==================
pause >nul
goto home
::Monsters
:WOLFs
set eNAME=Wolf
set eMHP=26
set eHP=%eMHP%
set eDMG=4
set eCRIT=8
set eLVL=1
set eGOLD=25
set eEXP=20
set eRUN=65
goto:eof
:SPIDERs
set eNAME=Spider
set eMHP=52
set eHP=%eMHP%
set eDMG=6
set eCRIT=12
set eLVL=2
set eGOLD=35
set eEXP=35
set eRUN=70
goto:eof
:GOBLINs
set eNAME=Goblin
set eMHP=78
set eHP=%eMHP%
set eDMG=8
set eCRIT=12
set eLVL=3
set eGOLD=45
set eEXP=40
set eRUN=75
goto:eof
:KNIGHTs
set eNAME=Knight
set eMHP=115
set eHP=%eMHP%
set eDMG=10
set eCRIT=20
set eLVL=4
set eGOLD=80
set eEXP=75
set eRUN=75
goto:eof
:ROYALs
set eNAME=Royal Guard
set eMHP=160
set eHP=%eMHP%
set eDMG=14
set eCRIT=28
set eLVL=6
set eGOLD=120
set eEXP=125
set eRUN=75
goto:eof
:DRAGONs
set eNAME=Dragon
set eMHP=350
set eHP=%eMHP%
set eDMG=20
set eCRIT=40
set eLVL=10
set eGOLD=1500
set eEXP=1500
set eRUN=99
goto:eof
:HARPs
set eNAME=Harpy
set eMHP=850
set eHP=%eMHP%
set eDMG=100
set eCRIT=150
set eLVL=25
set eGOLD=10000
set eEXP=2500
set eRUN=99
goto:eof
:HYDRAs
set eNAME=Hydra
set eMHP=1500
set eHP=%eMHP%
set eDMG=500
set eCRIT=800
set eLVL=50
set eGOLD=25000
set eEXP=5000
set eRUN=99
goto:eof
:OWAs
set eNAME=Sephiroth
set eMHP=10000
set eHP=%eMHP%
set eDMG=1000
set eCRIT=1200
set eLVL=??
set eGOLD=175000
set eEXP=10000
set eRUN=100
goto:eof
:SAVE
(
echo set NAME=%NAME%
echo set MHP=%MHP%
echo set HP=%MHP%
echo set DMG=%DMG%
echo set LVL=%LVL%
echo set EXP=%EXP%
echo set MEXP=%MEXP%
echo set GOLD=%GOLD%
echo set DEF=%DEF%
echo set MS=%MS%
echo set WEP=%WEP%
echo set ARM=%ARM%
echo set HPU=%HPU%
echo set BLOCKt=FALSE
echo set BOSS1=%BOSS1%
echo set BOSS2=%BOSS2%
echo set BOSS=%BOSS%
) > UserDatas\GameSave.bat
goto:eof
:LOOT
set R=%RANDOM%
set /a RANg=%RANDOM% * 100 / 32768 + 1
set R=%RANDOM%
set /a RANe=%RANDOM% * 100 / 32768 + 1
if %RANg% GTR 85 set BONUSg=150
if %RANe% GTR 85 set BONUSe=50
goto:eof
:STATS
cls
echo =======================
echo  %NAME% Lvl.%LVL%
echo =======================
echo  EXP:%EXP%/%MEXP%
echo.
echo   HP:%HP%/%MHP%  
echo  DMG:%DMG%
echo  DEF:%DEF%
echo.
echo  Gold:%GOLD%g
echo  Enemies Slain:%MS%
echo =======================
echo  Any Button To Go Back
echo =======================
pause >nul
goto:eof
:STORE
cls
set /a WEPg=(%WEP%*125)+125
set /a ARMg=(%ARM%*125)+125
set /a HPUg=(%HPU%*125)+125
echo =======================
echo          STORE
echo =======================
echo.
echo  Gold:%GOLD%g
echo.
echo  1.Weapon Upgrade: %WEP%
echo     %WEPg%g
echo.  
echo  2.Armour Upgrade: %ARM%
echo     %ARMg%g
echo.
echo  3.Health Upgrade: %HPU%
echo     %HPUg%g
echo.
echo =======================
echo  (W)     Back      (W)        
echo =======================
choice /c 123w /n >nul
if %ERRORLEVEL%==4 goto:eof
if %ERRORLEVEL%==1 (
 set PRICE=%WEPg%
 set PRICEn=WEP
 set MOD=DMG
 set AMOUNT=1
)
if %ERRORLEVEL%==2 (
 set PRICE=%ARMg%
 set PRICEn=ARM
 set MOD=DEF
 set AMOUNT=1
)
if %ERRORLEVEL%==3 (
 set PRICE=%HPUg%
 set PRICEn=HPU
 set MOD=MHP
 set AMOUNT=5
)
if %PRICE% GTR %GOLD% goto STORE
set /a GOLD-=%PRICE%
set /a %PRICEn%+=1
set /a %MOD%+=%AMOUNT%
goto STORE
 
:SETTINGS
cls
echo ======================
echo        Settings
echo ======================
echo.
echo     1. Admin:%ADM%
echo.
echo ======================
echo  (W)     Back     (W)        
echo ======================
choice /c 1234w /n >nul
if %ERRORLEVEL%==1 (
 set TF=%ADM%
 set ST=ADM
)
if %ERRORLEVEL%==5 goto home
if %TF%==FALSE (set %ST%=TRUE) else set %ST%=FALSE
(
echo set ADM=%ADM%
) > UserDatas\Settings.bat
goto SETTINGS
:ADMIN
if %ADM%==FALSE goto CHOICE
cls
echo ==========================
echo           Admin
echo ==========================
echo.
echo   Please Input Password:
echo.
echo ==========================
set /p INPUT=::
if %INPUT% NEQ %PASSWORD% (
 set MSG=Incorrect Password.
 goto CHOICE
)
:ADMIN2
cls
echo ==========================
echo           Admin
echo ==========================
echo.
echo What would you like to do?
echo.
echo   1.MORE HP
echo.
echo   2.MORE GOLD
echo.     
echo   3.MORE DMG 
echo.  
echo   4.MORE DEF
echo.
echo   5.LEVEL UP    
echo.
echo ==========================
echo  (W)       Back       (W)        
echo ==========================
choice /c 12345w6 /n >nul
if %ERRORLEVEL%==1 set MOD=MHP
if %ERRORLEVEL%==2 set MOD=GOLD
if %ERRORLEVEL%==3 set MOD=DMG
if %ERRORLEVEL%==4 set MOD=DEF
if %ERRORLEVEL%==5 (
 set MOD=LVLs
 goto LVLr
)
if %ERRORLEVEL%==6 goto CHOICE
cls
echo ==========================
echo           Admin
echo ==========================
echo.
echo       Set value for:
echo.         
echo          "%MOD%"
echo.
echo ==========================
set /p INPUT=::
set %MOD%=%INPUT%
goto ADMIN2
:LVLr
cls
echo ==========================
echo           Admin
echo ==========================
echo.
echo    How many times would
echo     you like to level:
echo.         
echo           "LVL"
echo.
echo ==========================
set /p INPUT=::
if %INPUT%==0 goto ADMIN2
set counter=0
:LVLUPr
set /a counter+=1
set /a EXP=%MEXP%
call :LVLCHECK
if %counter%==%INPUT% goto ADMIN2
goto LVLUPr



:tic
title -Tic Tac Toe- KBytesOS
  REM Skill level
  set sl=
  cls
  echo                        THE TIC TAC TOE BY                (Q to Quit)
  echo                                        -KBytesOS
  echo.
  echo.
  echo        Pick your skill level (press a number)
  echo.
  echo               (1) VERY EASY
  echo               (2) LITTLE BIT HARD
  echo               (3) U WILL NOT WIN 
  CHOICE /c:123q /n > nul
  if errorlevel 4 goto games
  if errorlevel 3 set sl=3
  if errorlevel 3 goto layout
  if errorlevel 2 set sl=2
  if errorlevel 2 goto layout
  set sl=1

:LAYOUT
  REM Player turn ("x" or "o")
  set pt=
  REM Game winner ("x" or "o")
  set gw=
  REM No moves
  set nm=
  REM Set to one blank space after equal sign (check with cursor end)
  set t1= 
  set t2= 
  set t3= 
  set t4= 
  set t5= 
  set t6= 
  set t7= 
  set t8= 
  set t9= 

:UPDATE
  cls
  echo   (S to set skill level)       THE TIC TAC TOE BY                (Q to quit)
  echo                                                -KBytesOS
  echo.
  echo                               You are the X player. 
  echo                    Press the number where you want to put an X.     
  echo.
  echo   Skill level %sl%                       7 8 9 
  echo                                       4 5 6
  echo                                       1 2 3
  echo.
  echo                                       :   :
  echo                                     %t1% : %t2% : %t3%
  echo                                   ....:...:....
  echo                                     %t4% : %t5% : %t6%
  echo                                   ....:...:....
  echo                                     %t7% : %t8% : %t9%
  echo                                       :   :
  if "%gw%"=="x" goto winx2
  if "%gw%"=="o" goto wino2
  if "%nm%"=="0" goto nomoves

:PLAYER
  set pt=x
  REM Layout is for keypad. Change CHOICE to "/c:123456789sq  /n > nul"
  REM for numbers to start at top left (also change user layout above).
  CHOICE /c:789456123sq /n > nul
  if errorlevel 11 goto games
  if errorlevel 10 goto tic
  if errorlevel 9 goto 9
  if errorlevel 8 goto 8
  if errorlevel 7 goto 7
  if errorlevel 6 goto 6
  if errorlevel 5 goto 5
  if errorlevel 4 goto 4
  if errorlevel 3 goto 3
  if errorlevel 2 goto 2
  goto 1

:1  
  REM Check if "x" or "o" already in square.
  if "%t1%"=="x" goto player
  if "%t1%"=="o" goto player
  set t1=x
  goto check
:2  
  if "%t2%"=="x" goto player
  if "%t2%"=="o" goto player
  set t2=x
  goto check
:3  
  if "%t3%"=="x" goto player
  if "%t3%"=="o" goto player
  set t3=x
  goto check
:4  
  if "%t4%"=="x" goto player
  if "%t4%"=="o" goto player
  set t4=x
  goto check
:5  
  if "%t5%"=="x" goto player
  if "%t5%"=="o" goto player
  set t5=x
  goto check
:6  
  if "%t6%"=="x" goto player
  if "%t6%"=="o" goto player
  set t6=x
  goto check
:7  
  if "%t7%"=="x" goto player
  if "%t7%"=="o" goto player
  set t7=x
  goto check
:8  
  if "%t8%"=="x" goto player
  if "%t8%"=="o" goto player
  set t8=x
  goto check
:9  
  if "%t9%"=="x" goto player
  if "%t9%"=="o" goto player
  set t9=x
  goto check

:COMPUTER
  set pt=o
  if "%sl%"=="1" goto skill1  
 REM (win corner to corner)
  if "%t1%"=="o" if "%t3%"=="o" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t1%"=="o" if "%t9%"=="o" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t1%"=="o" if "%t7%"=="o" if not "%t4%"=="x" if not "%t4%"=="o" goto c4  
  if "%t3%"=="o" if "%t7%"=="o" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t3%"=="o" if "%t9%"=="o" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t9%"=="o" if "%t7%"=="o" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
 REM (win outside middle to outside middle)
  if "%t2%"=="o" if "%t8%"=="o" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t4%"=="o" if "%t6%"=="o" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
 REM (win all others)
  if "%t1%"=="o" if "%t2%"=="o" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if "%t1%"=="o" if "%t5%"=="o" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t1%"=="o" if "%t4%"=="o" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t2%"=="o" if "%t5%"=="o" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%t3%"=="o" if "%t2%"=="o" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t3%"=="o" if "%t5%"=="o" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t3%"=="o" if "%t6%"=="o" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t4%"=="o" if "%t5%"=="o" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t6%"=="o" if "%t5%"=="o" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t7%"=="o" if "%t4%"=="o" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t7%"=="o" if "%t5%"=="o" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if "%t7%"=="o" if "%t8%"=="o" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t8%"=="o" if "%t5%"=="o" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t9%"=="o" if "%t8%"=="o" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t9%"=="o" if "%t5%"=="o" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t9%"=="o" if "%t6%"=="o" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
 REM (block general attempts) -----------------------------------------------
  if "%t1%"=="x" if "%t2%"=="x" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if "%t1%"=="x" if "%t5%"=="x" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t1%"=="x" if "%t4%"=="x" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t2%"=="x" if "%t5%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%t3%"=="x" if "%t2%"=="x" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t3%"=="x" if "%t5%"=="x" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t3%"=="x" if "%t6%"=="x" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t4%"=="x" if "%t5%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t6%"=="x" if "%t5%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t7%"=="x" if "%t4%"=="x" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t7%"=="x" if "%t5%"=="x" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if "%t7%"=="x" if "%t8%"=="x" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if "%t8%"=="x" if "%t5%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t9%"=="x" if "%t8%"=="x" if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if "%t9%"=="x" if "%t5%"=="x" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t9%"=="x" if "%t6%"=="x" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
 REM (block obvious corner to corner) 
  if "%t1%"=="x" if "%t3%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t1%"=="x" if "%t9%"=="x" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t1%"=="x" if "%t7%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4  
  if "%t3%"=="x" if "%t7%"=="x" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t3%"=="x" if "%t9%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t9%"=="x" if "%t7%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%sl%"=="2" goto skill2
 REM (block sneaky corner to corner 2-4, 2-6, etc.) 
  if "%t2%"=="x" if "%t4%"=="x" if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if "%t2%"=="x" if "%t6%"=="x" if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if "%t8%"=="x" if "%t4%"=="x" if not "%t7%"=="x" if not "%t7%"=="o" goto c7  
  if "%t8%"=="x" if "%t6%"=="x" if not "%t9%"=="x" if not "%t9%"=="o" goto c9
 REM (block offset corner trap 1-8, 1-6, etc.)
  if "%t1%"=="x" if "%t6%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%t1%"=="x" if "%t8%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t3%"=="x" if "%t8%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t3%"=="x" if "%t4%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%t9%"=="x" if "%t4%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t9%"=="x" if "%t2%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t7%"=="x" if "%t2%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t7%"=="x" if "%t6%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2

:SKILL2
 REM (block outside middle to outside middle)
  if "%t2%"=="x" if "%t8%"=="x" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if "%t4%"=="x" if "%t6%"=="x" if not "%t5%"=="x" if not "%t5%"=="o" goto c5
 REM (block 3 corner trap)
  if "%t1%"=="x" if "%t9%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t3%"=="x" if "%t7%"=="x" if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if "%t1%"=="x" if "%t9%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t3%"=="x" if "%t7%"=="x" if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if "%t1%"=="x" if "%t9%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t3%"=="x" if "%t7%"=="x" if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if "%t1%"=="x" if "%t9%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  if "%t3%"=="x" if "%t7%"=="x" if not "%t8%"=="x" if not "%t8%"=="o" goto c8
:SKILL1 
 REM (just take a turn) 
  if not "%t5%"=="x" if not "%t5%"=="o" goto c5
  if not "%t1%"=="x" if not "%t1%"=="o" goto c1
  if not "%t3%"=="x" if not "%t3%"=="o" goto c3
  if not "%t7%"=="x" if not "%t7%"=="o" goto c7
  if not "%t9%"=="x" if not "%t9%"=="o" goto c9
  if not "%t2%"=="x" if not "%t2%"=="o" goto c2
  if not "%t4%"=="x" if not "%t4%"=="o" goto c4
  if not "%t6%"=="x" if not "%t6%"=="o" goto c6
  if not "%t8%"=="x" if not "%t8%"=="o" goto c8
  set nm=0
  goto update

:C1  
  set t1=o
  goto check
:C2  
  set t2=o
  goto check
:C3  
  set t3=o
  goto check
:C4  
  set t4=o
  goto check
:C5  
  set t5=o
  goto check
:C6  
  set t6=o
  goto check
:C7  
  set t7=o
  goto check
:C8  
  set t8=o
  goto check
:C9  
  set t9=o
  goto check

:CHECK
  if "%t1%"=="x" if "%t2%"=="x" if "%t3%"=="x" goto winx
  if "%t4%"=="x" if "%t5%"=="x" if "%t6%"=="x" goto winx
  if "%t7%"=="x" if "%t8%"=="x" if "%t9%"=="x" goto winx
  if "%t1%"=="x" if "%t4%"=="x" if "%t7%"=="x" goto winx
  if "%t2%"=="x" if "%t5%"=="x" if "%t8%"=="x" goto winx
  if "%t3%"=="x" if "%t6%"=="x" if "%t9%"=="x" goto winx
  if "%t1%"=="x" if "%t5%"=="x" if "%t9%"=="x" goto winx
  if "%t3%"=="x" if "%t5%"=="x" if "%t7%"=="x" goto winx
  if "%t1%"=="o" if "%t2%"=="o" if "%t3%"=="o" goto wino
  if "%t4%"=="o" if "%t5%"=="o" if "%t6%"=="o" goto wino
  if "%t7%"=="o" if "%t8%"=="o" if "%t9%"=="o" goto wino
  if "%t1%"=="o" if "%t4%"=="o" if "%t7%"=="o" goto wino
  if "%t2%"=="o" if "%t5%"=="o" if "%t8%"=="o" goto wino
  if "%t3%"=="o" if "%t6%"=="o" if "%t9%"=="o" goto wino
  if "%t1%"=="o" if "%t5%"=="o" if "%t9%"=="o" goto wino
  if "%t3%"=="o" if "%t5%"=="o" if "%t7%"=="o" goto wino
  if "%pt%"=="x" goto computer
  if "%pt%"=="o" goto update

:WINX
  set gw=x
  goto update
:WINX2
  echo   You win!
  echo   Play again (Y,N)?
  CHOICE /c:ynsq /n > nul
  if errorlevel 4 goto games
  if errorlevel 3 goto begin
  if errorlevel 2 goto games
  goto layout

:WINO
  set gw=o
  goto update
:WINO2
  echo   Sorry, You lose.
  echo   Play again (Y,N)?
  CHOICE /c:ynsq /n > nul
  if errorlevel 4 goto games
  if errorlevel 3 goto begin
  if errorlevel 2 goto games
  goto layout

:NOMOVES
  echo   There are no more moves left!
  echo   Play again (Y,N)?
  CHOICE /c:ynsq /n > nul
  if errorlevel 4 goto games
  if errorlevel 3 goto begin
  if errorlevel 2 goto games
  goto layout

:END
  cls
  echo THE TIC TAC TOE BY -KBytesOS       
  echo.
  REM Clear all variables (no spaces after equal sign).
  set gw=
  set nm=
  set sl=
  set pt=
  set t1=
  set t2=
  set t3=
  set t4=
  set t5=
  set t6=
  set t7=
  set t8=
  set t9=



:PASSGEN
title -Pass Generator- KBytesOS
cls
title Password Generator
echo I will make you a new password.
echo Please write the password down somewhere in case you forget it.
echo ----------------------------------------­-----------------------
echo 1) 1 Random Password
echo 2) 5 Random Passwords
echo 3) 10 Random Passwords
echo Input your choice
choice /c 123 /n >nul
if %ERRORLEVEL%==1 goto A if NOT goto PASSGEN
if %ERRORLEVEL%==2 goto B if NOT goto PASSGEN
if %ERRORLEVEL%==3 goto C if NOT goto PASSGEN
:A
cls
echo Your password is %random%
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
choice /c 12 /n >nul
if %ERRORLEVEL%==1 goto PASSGEN
if %ERRORLEVEL%==2 goto menu

:B
cls
echo Your 5 passwords are %random%, %random%, %random%, %random%, %random%.
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
choice /c 12 /n >nul
if %ERRORLEVEL%==1 goto PASSGEN
if %ERRORLEVEL%==2 goto menu
:C
cls
echo Your 10 Passwords are %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%, %random%
echo Now choose what you want to do.
echo 1) Go back to the beginning
echo 2) Exit
choice /c 12 /n >nul
if %ERRORLEVEL%==1 goto PASSGEN
if %ERRORLEVEL%==2 goto menu


:rabf
title -Raise A Batched Floppa- KBytesOS
SETLOCAL EnableDelayedExpansion
set /a SplashVar=%random% %%12
if !SplashVar! equ 0 (
    set SplashText=Terra will be soon...
)
if !SplashVar!==1 (
    set SplashText=Created by GladfanIsHere!
)
if !SplashVar!==2 (
    set SplashText=Sissio also takes care of Floppa
)
if !SplashVar!==3 (
    set SplashText=Not made in Japan
)
if !SplashVar!==4 (
    set SplashText=Doesn't includes Bingus!!
)
if !SplashVar!==5 (
    set SplashText=Includes Floppa!!
)
if !SplashVar!==6 (
    set SplashText=Luxury cherries cost 20$?!
)
if !SplashVar!==7 (
    set SplashText=Did you know? Maharaja Cloudi loves RaBF!
)
if !SplashVar!==8 (
    set SplashText=Gladfan likes eating empanadas with Floppa
)
if !SplashVar!==9 (
    set SplashText=Almond water... good idea?
)
if !SplashVar!==10 (
    set SplashText=Sissio is part of Cloudiland
)
if !SplashVar!==11 (
    set SplashText=I Modified This -SesatGuy
)
cls
echo Raise a batched Floppa
echo.
echo !SplashText!
echo.
echo         Version
echo          0.1.3 
echo     (KBOS Modified)
echo -----------------------
echo 1) Play
echo 2) Help
echo 3) Quit
echo -----------------------
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto startoptions
)
if %errorlevel% equ 2 (
    goto help
)
if %errorlevel% equ 3 (
    goto menu
)
pause

:help
cls
echo         Help
echo -----------------------
echo 1) Return
echo 2) Instructions 
echo 3) Credits
echo -----------------------
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto rabf
)
if %errorlevel% equ 2 (
    goto instructions
)
if %errorlevel% equ 3 (
    goto credits
)
pause

:instructions
cls
echo      Instructions
echo -----------------------
echo Raise your Floppa by taking care of him,
echo and some random events will happen
echo they may be good or bad!
echo Beat yourself with the "score" feature
echo Your best score will be saved so you
echo can beat it with now problem!
echo -----------------------
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:credits
cls
echo        Credits
echo -----------------------
echo       Created by
echo      GladfanIsHere
echo      Contributors
echo      Sissiogamer1
echo -----------------------
echo 1) Return
choice /c 1 /m "Return? "
   
if %errorlevel% equ 1 (
    goto help
)

:startoptions
cls
echo      Start Options
echo -----------------------
echo 1) New game
echo 2) Load game
echo 3) Return
echo -----------------------
echo.
choice /c 123
   
if %errorlevel% equ 1 (
    goto newgames
)
if %errorlevel% equ 2 (
    goto loadgame
)
if %errorlevel% equ 3 (
    goto rabf
)
pause

::New "newgames" (Slot selector)
:newgames
set selectedSlot=0
cls
echo      Game slots
echo -----------------------
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo -----------------------
choice /c 1234 /m "Which slot are you selecting? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto newstartsettings
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto newstartsettings
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto newstartsettings
)
if %errorlevel% equ 4 (
    goto startoptions
)
:newstartsettings
cls
echo      Slot%select% settings
echo -----------------------
echo 1) Return
echo 2) Game modes
echo 3) Start new game
echo -----------------------
echo.
choice /c 123
if %errorlevel% equ 1 (
    goto newgames
)
if %errorlevel% equ 2 (
    goto gamemodeSelect
)
if %errorlevel% equ 3 (
    if defined gamemodeS (
        goto newstart
    ) else (
        goto newstartsettings
    )
)

:passwordSet
cls
echo      Password set
echo -----------------------
echo 1) Return
echo 2) Random password
echo -----------------------
echo         WARNING
echo You can't use spaces or
echo unicode charaters or else
echo  the game could crash
echo.
set /p inputPass=" Insert a password> "
pause
set PasswordTemp=%inputPass%
if %PasswordTemp%==1 (
    goto newstartsettings
)
if %PasswordTemp%==2 (
    goto randomPassword
)
goto passwordConfirmation
goto passwordSet

:randomPassword
cls
set /a firdig=%random% %%9
set /a secdig=%random% %%9
set /a thidig=%random% %%9
set /a foudig=%random% %%9
set /a fiftdig=%random% %%9

set PasswordTemp=%firdig%%secdig%%thidig%%foudig%%fiftdig%
goto passwordConfirmation


:passwordConfirmation
cls
echo.
echo.
echo.
echo Are you sure you want your Password
echo       to be %PasswordTemp% ?
echo.
echo.
echo.
set /p inputYN=" Y/N? "
pause
if %inputYN%==Y (
    cls
    set Password=%PasswordTemp%
    echo.
    echo %PasswordTemp% was set as this slot's password
    echo                 correctly!
    echo.
    pause
    goto newstartsettings
)
if %inputYN%==N (
    goto passwordSet
)
goto passwordConfirmation

:gamemodeSelect
cls
echo       Game modes
echo -----------------------
echo 1. Return
echo 2. Normal mode
echo 3. Hard mode
echo -----------------------
echo.
choice /c 123
if %errorlevel% equ 1 (
   goto newstartsettings
)

if %errorlevel% equ 2 (
   goto normalmode 
)

if %errorlevel% equ 3 (
   goto hardmode
)

:hardmode
cls
        echo      Hard mode
        echo -----------------------
        echo This is the hard mode,
        echo this mode is more challenging
        echo than the normal mode,
        echo recommended for experienced
        echo players that have played
        echo the normal mode
        echo -----------------------
        echo Difficulty: 7 / 7
        echo.
        echo 1. Yes
        echo 2. Nah, another one
        echo.
        choice /c 12
        if %errorlevel% equ 1 (
            set gamemodeS=2
            goto newstartsettings
        )
        if %errorlevel% equ 2 (
            goto gamemodeSelect
        )
        goto gamemodeSelect

:normalmode
cls
        echo      Normal mode
        echo -----------------------
        echo This is the normal mode,
        echo it's recommended to play
        echo this mode after playing the
        echo tutorial
        echo -----------------------
        echo Difficulty: 4 / 7
        echo.
        echo 1. Yes
        echo 2. Nah, another one
        echo.
        choice /c 12
        if %errorlevel% equ 1 (
            set gamemodeS=1
            goto newstartsettings
        )
        if %errorlevel% equ 2 (
            goto gamemodeSelect
        )   

::New start (old :newgames)
:newstart
::-statsSlot
::Floppa Stats
set health=20
set fhunger=100
set fsanity=100
set fage=1
set factions=0
set fname=Floppa
::Game stats
set money=0
set score=0
set currentDM=None
::-invStatsSlot
set playerhasfood=0
set sanityPills=0
set milk=0
set birthdayCake=0
set mrbeastticket=0
set fopsoda=0
set tag=0
::-gameSettings
set version=0.1.3
set gamemode=%gamemodeS%
if %gamemode%==2 (
    set health=30
)
::End of "set" command
::-"Exporting" data
::Stats
(
    echo %health%
    echo %fhunger%
    echo %fsanity%
    echo %fage%
    echo %factions%
    echo %fname%
    echo %money%
    echo %score%
    echo %currentDM%
    echo %playerhasfood%
    echo %sanityPills%
    echo %milk%
    echo %birthdayCake%
    echo %mrbeastticket%
    echo %fopsoda%
    echo %tag%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score
set bestscore=0
(
    echo %bestscore%
)> UserDatas/stats/bestSc.fdata
::Death messages
set dstarve=Your Floppa starved to death!
set dhealth1=Your Floppa health was not good... 
(
    echo %dstarve%
    echo %dhealth1%
)> UserDatas/stats/deathMessages.fdata

(
    echo Yes
)> UserDatas/stats/slot%selectedSlot%/inUse.fdata

(
    echo %version%
    echo %gamemode%
)> UserDatas/stats/slot%selectedSlot%/inUse.fdata
goto loadgamestart



::New "loadgame" (Slot selector)
:loadgame
set selectedSlot=0
cls
echo    Load a Game slot
echo -----------------------
echo 1) Slot 1
echo 2) Slot 2
echo 3) Slot 3
echo 4) Return
echo -----------------------
choice /c 1234 /m "Which slot are you loading? "
if %errorlevel% equ 1 (
    set selectedSlot=1
    goto loadgamestart
)
if %errorlevel% equ 2 (
    set selectedSlot=2
    goto loadgamestart
)
if %errorlevel% equ 3 (
    set selectedSlot=3
    goto loadgamestart
)
if %errorlevel% equ 4 (
    goto startoptions
)


::Load the game (old :loadgame)
:loadgamestart
cls
if exist UserDatas/stats/slot%selectedSlot%/inUse.fdata (
    (
    set /p health=
    set /p fhunger=
    set /p fsanity=
    set /p fage=
    set /p factions=
    set /p fname=
    set /p money=
    set /p score= 
    set /p currentDM=
    set /p playerhasfood=
    set /p sanityPills=
    set /p milk=
    set /p birthdayCake=
    set /p mrbeastticket=
    set /p fopsoda=
    set /p tag=
)< UserDatas/stats/slot%selectedSlot%/data.fdata
    (
        set /p bestscore=
    )< UserDatas/stats/bestSc.fdata
    (
        set /p dstarve=
        set /p dhealth1=
    )< UserDatas/stats/deathMessages.fdata
    (
        set /p version=
        set /p gamemode=
    )< UserDatas/stats/slot%selectedSlot%/configData.fdata
    goto welcome
) else (
    cls
    echo This slot has no saved data.
    pause
    goto startoptions
)
::Welcome message!!
:welcome
if %gamemodeS% equ 2 (
    goto hardrabf (
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set fname=%fname%
set money=%money%
set score=%score%
set currentDM=%currentDM%
set playerhasfood=%playerhasfood%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set tag=%tag%
set bestscore=%bestscore%
set selectedSlot=%selectedSlot%
    )
)
cls
echo        Welcome
echo          to
echo Raise a batched Floppa!
echo I hope you enjoy the game!
echo -----------------------
echo Floppa hunger = %fhunger%
echo Floppa sanity = %fsanity%
echo Floppa age = %fage%
echo Floppa health = %health%
echo Floppa name = %fname%
echo Your money = %money%$
echo Score = %score%
echo Best score = %bestscore%
echo -----------------------
echo These are the game stats

pause
goto game

::Game related stuff
:game
SETLOCAL DisableDelayedExpansion
set /a rnd1=%random% %%100
cls
if %factions%==10 (
   set /a fage=%fage% + 1
   set factions=0
   echo %fname% age increased by 1
   echo and now it's %fage%!
)
if %health% GTR 20 (
    set health=20
)
if %fhunger% GTR 100 (
   set fhunger=100
)
if %fsanity% GTR 100 (
   set fsanity=100
)
if %fhunger% LSS 1 (
    set currentDM=%dstarve%
    goto gvsave1
)
if %health% LSS 1 (
    set currentDM=%dhealth1%
    goto gvsave1
)
if %fsanity% LSS 20 (
   set /a hunger=%hunger% - 10
   set /a health=%health% - 5
   echo due to %fname%'s sanity
   echo being less than 20 %fname%
   echo lost 10 hunger and 5 health!
)


if %rnd1%==86 (
    goto travcake
)
if %rnd1%==67 (
    goto travMrbtick
)
if %rnd1%==35 (
    goto travBandits
)
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %health% LEQ 0 (
    set health=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
set /a score=%fhunger% + %fsanity% * %fage% + %money% / 3
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo -----------------------
echo 1) Pet
echo 2) Full bowl
echo 3) Buy something
echo 4) Items
echo 5) Save game
echo 6) Go to main menu
echo -----------------------
echo Health=%health%
echo Score=%score%
echo (Normal Mode)
echo.

choice /c 123456 /m "What do you want to do?"

if %errorlevel% equ 1 (
    goto pet
)
if %errorlevel% equ 2 (
    goto fullbowl
)
if %errorlevel% equ 3 (
    goto shop
)
if %errorlevel% equ 4 (
    goto items
)
if %errorlevel% equ 5 (
    goto save2
)
if %errorlevel% equ 6 (
    goto rabf
)

:pet
cls
set /a rnd=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%10
set /a rndb2=%random% %%10
set /a rndc=%random% %%30
set /a rndd=%random% %%20
echo You petted %fname% and it dropped %rnd%$
echo %fname% recovered %rndb% sanity and got %rnd%$!
set /a money=%money% + %rnd%
set /a fsanity=%fsanity% + %rndb%
echo My money is now %money%$
echo %fname%'s sanity is now %fsanity%
if %rnda%==0 (
    pause
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndd%
)

pause
goto save

pause
set /a factions=%factions% + 1
goto save

:fullbowl
cls
set /a rnd1=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%9
set /a rndc=%random% %%10
if %playerhasfood%==0 (
   echo [!]You don't have food to full the bowl
   if %rnda%==0 (
pause
goto save
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndc%
)
   pause
   goto save
)
if %playerhasfood%==1 (
   echo You filled %fname%'s bowl
   echo and he ate it... %fname% recovered %rnd1% hunger
   set /a fhunger=%fhunger% + %rnd1%
   set playerhasfood=0
   pause
   set /a factions=%factions% + 1
   goto save
)

:item
cls

::Shop related stuff here !!
:shop
cls
set product=None
echo                   Shop
echo --------------------------------------------
echo 1) Return
echo 2) Food (47$)
echo 3) Sanity pills (230$)
echo 4) Milk (87$)
echo 5) Birthday cake (673$)
echo 6) Fop Soda (30$)
echo 7) Tag (500$)
echo --------------------------------------------
echo (Once you've selected something 
echo it will buy automatically
echo without any confirmation screen,
echo if you have the required
echo money, obviously)
echo.
choice /c 1234567 /m "What do you want buy? "
if %errorlevel% equ 1 (
    goto game
)
::Food
if %errorlevel% equ 2 (
    if %playerhasfood%==1 (
        cls
        echo [!]You already have food.
        pause
        goto shop
    )
    if %playerhasfood%==0 (
        if %money% GEQ 47 (
        cls
        echo You bought the item "Food", now you can
        echo fill %fname%'s bowl!
        set playerhasfood=1
        set /a money=%money% - 47
        pause
        goto save
    )
    if %money% LSS 47 (
        cls
        echo You don't have enough money
        echo to buy the item "Food"!
        pause
        goto shop
    )
    )
        
)
::Sanity pills
if %errorlevel% equ 3 (
    if %sanityPills%==1 (
        cls
        echo [!]You already have Sanity pills.
        pause
        goto shop
    )
    if %sanityPills%==0 (
        if %money% GEQ 230 (
        cls
        echo You bought the item "Sanity pills", now you can
        echo give them to %fname% to increase his sanity
        set sanityPills=1
        set /a money=%money% - 230
        pause
        goto save
    )
    if %money% LSS 230 (
        cls
        echo You don't have enough money
        echo to buy the item "Sanity pills"!
        pause
        goto shop
    )
    )
)
::Milk
if %errorlevel% equ 4 (
    if %milk%==1 (
        cls
        echo [!]You already have Milk.
        pause
        goto shop
    )
    if %milk%==0 (
        if %money% GEQ 87 (
        cls
        echo You bought the item "Milk", this works like Food
        echo but it can make %fname% to recover up to 60
        echo hunger instead of 30!
        set milk=1
        set /a money=%money% - 87
        pause
        goto save
    )
    if %money% LSS 87 (
        cls
        echo You don't have enough money
        echo to buy the item "Milk"!
        pause
        goto shop
    )
    )
)
::Birthday cake
if %errorlevel% equ 5 (
    if %birthdayCake%==1 (
        cls
        echo [!]You already have a Birthday cake.
        pause
        goto shop
    )
    if %birthdayCake%==0 (
        if %money% GEQ 673 (
        cls
        echo You bought the "Birthday cake", this will make
        echo %fname% age 2 years, it also will be able
        echo to recover 67 hunger.
        set birthdayCake=1
        set /a money=%money% - 673
        pause
        goto save
    )
    if %money% LSS 673 (
        cls
        echo You don't have enough money
        echo to buy the "Birthday cake"!
        pause
        goto shop
    )
    )
)
::Fop soda
if %errorlevel% equ 6 (
    if %fopsoda%==1 (
        cls
        echo [!]You already have a Fop Soda.
        pause
        goto shop
    )
    if %fopsoda%==0 (
        if %money% GEQ 30 (
        cls
        echo You bought the "Fop Soda", this will heal
        echo            %fname% by 5
        set fopsoda=1
        set /a money=%money% - 30
        pause
        goto save
    )
    if %money% LSS 30 (
        cls
        echo You don't have enough money
        echo to buy the "Fop Soda"!
        pause
        goto shop
    )
    )
)
::Tag
if %errorlevel% equ 7 (
    if %tag%==1 (
        cls
        echo [!]You already have a Tag.
        pause
        goto shop
    )
    if %tag%==0 (
        if %money% GEQ 500 (
        cls
        echo You bought the "Tag", now you can
        echo rename %fname% to whatever you want!
        set tag=1
        set /a money=%money% - 500
        pause
        goto save
    )
    if %money% LSS 500 (
        cls
        echo You don't have enough money
        echo to buy the "Tag"!
        pause
        goto shop
    )
    )
)
goto shop

::Items select menu

:items
set /a rndBeast=%random% %%1500
set /a rnd2=%random% %%30
cls
echo        Items
echo -----------------------
echo 1) Return
echo 2) Sanity pills
echo 3) Milk
echo 4) Birthday Cake
echo 5) Mr.Beast event ticket
echo 6) Fop Soda
echo 7) Tag
echo -----------------------
echo        Stats
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo       Health=%health%
echo.

choice /c 1234567
if %errorlevel% equ 1 (
    goto game
)
::Sanity pills
if %errorlevel% equ 2 (
    if %sanityPills%==1 (
        cls
        echo You gave %fname% the
        echo "Sanity pills" and he ate them,
        echo He recovered 58 of his sanity!
        set /a fsanity=%fsanity% + 58
        set sanityPills=0
        pause
        goto save
    )
    if %sanityPills%==0 (
        cls
        echo You don't have any "Sanity Pills"!
        pause
        goto items
    )
)
::Milk
if %errorlevel% equ 3 (
    if %milk%==1 (
        cls
        echo You gave %fname% the Milk
        echo and he drank it... %fname%
        echo recovered %rnd2% hunger
        set /a fhunger=%fhunger% + %rnd2%
        set milk=0
        pause
        set /a factions=%factions% + 1
        goto save
    )
    if %milk%==0 (
        cls
        echo You don't have "Milk"!
        pause
        goto items
    )
)
::Birthday cake
if %errorlevel% equ 4 (
    if %birthdayCake%==1 (
        cls
        echo You gave %fname% the Birthday
        echo cake and sing happy birthday two
        echo times in a row, this made %fname%
        echo age 2 years, an also made him to 
        echo recover 67 hunger!
        set /a fhunger=%fhunger% + 67
        set birthdayCake=0
        pause
        set /a fage=%fage% + 2
        goto save
    )
    if %birthdayCake%==0 (
        cls
        echo You don't have a "Birthday cake"!
        pause
        goto items
    )
)
::Mr beast ticket
if %errorlevel% equ 5 (
    if %mrbeastticket%==1 (
        cls
        echo You sent %fname% to a Mr.Beast event,
        echo and he won %rndBeast%$, got %rndBeast%$
        set /a money=%money% + %rndBeast%
        pause
        goto save
    )
    if %mrbeastticket%==0 (
        cls
        echo You don't have a Ticket for the Mr.Beast event
        pause
        goto items
    )
)
::Fop Soda
if %errorlevel% equ 6 (
    if %fopsoda%==1 (
        cls
        echo You gave %fname% the Fop Soda
        echo and he drank it, %fname% healed
        echo            5 health
        set /a health=%health% + 5
        set fopsoda=0
        pause
        goto save
    )
    if %fopsoda%==0 (
        cls
        echo You don't have a Fop Soda
        pause
        goto items
    )
)

::Tag (Rename item)
if %errorlevel% equ 7 (
    if %tag%==1 (
        goto nameTagFloppa
    )
    if %tag%==0 (
        cls
        echo You don't have a Tag
        pause
        goto items
    )
)
:nameTagFloppa
        cls
        echo You decided to rename your Floppa
        echo by using the Tag, how do you want
        echo          to call him?
        echo ----------------------------------
        echo Please don't use spaces or unicode
        echo characters or the game could crash
        echo.
        set /p nameInput="Your Floppa new name > "
        set fname=%nameInput%
        pause
        cls
        if %fname%==Sissiogamer1 (
            echo Sissiogamer1, a pretty good dude.
            echo.
        )
        if %fname%==GladfanIsHere (
            echo GladfanIsHere, the creator of this game...
            echo.
        )
        if %fname%==Terra (
            echo Terra: HE'S TRYING TO KILL ME
            echo.
        )
        if %fname%==SesatGuy (
            echo SesatGuy: You.. Don't know how pain to modify this...
            echo.
        )
        echo You changed your Floppa name to
        echo %fname% !
        set tag=0
        pause
        goto save

::Events
:travBandits
set /a damageBandits=%random% %%10
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo [!] Some bandits entered into your house and
    echo         and hurted %fname!
    echo %fname% lost %damageBandits% health...
    set /a health=%health% - %damageBandits%
    echo.
    pause
    goto save
)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto save
)

:travMrbtick
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo  is selling you a ticket for the
    echo    Mr.Beast event for only 700$
    echo        Would you accept it?
    echo.
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 700 (
            cls
            echo You accepted the traveller's offer and
            echo bought the ticket for the Mr.Beast event,
            echo you can use it to make %fname% go to
            echo  a Mr.Beast event and win up to 1500$
            set /a money=%money% - 700
            set mrbeastticket=1
            pause
            goto save
        )
        if %money% LSS 700 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye fella!"
            pause
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto save
)
::Birthday cake traveller offer
:travcake
cls
echo Someone knocked at your door,
echo Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo is selling you a Birthday Cake for only
    echo     437$, Would you accept it?
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 437 (
            cls
            echo You accepted the traveller's offer and
            echo bought the Birthday Cake, you can use it to
            echo   age %fname% by 2 and sing to him
            echo   happy birthday two times in a row
            echo      and recover him 67 hunger
            set /a money=%money% - 437
            set birthdayCake=1
            pause
            goto save
        )
        if %money% LSS 437 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye baka!"
            pause
            goto save
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto save
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto save
)

::Game over!
:gameover
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
cls
if %score% GTR %bestscore% (
    set bestscore=%score%
    echo       New best!
) else (
    echo.
)
echo       GAME OVER!
echo.
echo %currentDM%
echo -----------------------
echo        Stats:
echo   Floppa age = %fage%
echo  Floppa sanity = %fsanity%
echo  Floppa hunger = %fhunger%
echo  Floppa health = %health%
echo Floppa name = %fname%
echo     Score = %score%
echo  Best score = %bestscore%
echo -----------------------
echo 1) Go to main menu
echo 2) Start a new game 
echo.
choice /c 12
if %errorlevel% equ 1 (
    set savebcdir=rabf
    goto savebc
)
if %errorlevel% equ 2 (
    set savebcdir=newgames
    goto savebc
)

::Save system related stuff
:savebc
set bestscore=%bestscore%
(
    echo %bestscore%
)> UserDatas/stats/bestSc.fdata

goto %savebcdir%

:save
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set fname=%fname%
set money=%money%
set score=%score%
set currentDM=%currentDM%
set playerhasfood=%playerhasfood%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%
set tag=%tag%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %fname%
echo %money%
echo %score%
echo %currentDM%
echo %playerhasfood%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
echo %tag%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata

goto game

:save2
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set fname=%fname%
set money=%money%
set score=%score%
set currentDM=%currentDM%
set playerhasfood=%playerhasfood%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%
set tag=%tag%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %fname%
echo %money%
echo %score%
echo %currentDM%
echo %playerhasfood%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
echo %tag%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata

echo The game was saved correctly!

pause
goto game

:gvsave1
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set fname=%fname%
set money=%money%
set score=%score%
set currentDM=%currentDM%
set playerhasfood=%playerhasfood%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%
set tag=%tag%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %fname%
echo %money%
echo %score%
echo %currentDM%
echo %playerhasfood%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
echo %tag%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata
goto gameover


:hardrabf
title -Hard Raise A Batched Floppa- KBytesOS
cls
echo    Welcome back to         
echo Raise a batched Floppa
echo       HARD MODE
echo This is a more challenging
echo mode than the normal one
echo -----------------------
echo Floppa hunger = %fhunger%
echo Floppa sanity = %fsanity%
echo Floppa age = %fage%
echo Floppa health=%health%
echo Floppa name=%fname%
echo Your money = %money%$
echo Score = %score%
echo Best score = %bestscore%
echo -----------------------
echo These are the game stats,
echo enjoy taking care of your
echo Floppa on HARD MODE!

pause
goto thegame

::Game related stuff
:thegame
set /a rnd1=%random% %%100
cls
if %factions%==10 (
   set /a fage=%fage% + 1
   set factions=0
   echo %fname% age increased by 1
   echo and now it's %fage%!
)
if %health% GTR 30 (
    set health=30
)
if %fhunger% GTR 100 (
   set fhunger=100
)
if %fsanity% GTR 100 (
   set fsanity=100
)
if %fhunger% LSS 1 (
    set currentDM=%dstarve%
    goto gvsaves1
)
if %health% LSS 1 (
    set currentDM=%dhealth1%
    goto gvsaves1
)
if %fsanity% LSS 60 (
   set /a hunger=%hunger% - 20
   set /a health=%health% - 10
   echo due to %fname%'s sanity
   echo being less than 60 %fname%
   echo lost 20 hunger and 10 health!
)


if %rnd1%==86 (
    goto travcakes
)
if %rnd1%==67 (
    goto travMrbticks
)
if %rnd1%==35 (
    goto travBanditss
)
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %health% LEQ 0 (
    set health=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
set /a score=%fhunger% + %fsanity% * %fage% + %money% / 3
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo -----------------------
echo 1) Pet
echo 2) Full bowl
echo 3) Buy something
echo 4) Items
echo 5) Save game
echo 6) Go to main menu
echo -----------------------
echo Health=%health%
echo Score=%score%
echo (Hard Mode)
echo.

choice /c 123456 /m "What do you want to do?"

if %errorlevel% equ 1 (
    goto pets
)
if %errorlevel% equ 2 (
    goto fullbowls
)
if %errorlevel% equ 3 (
    goto shops
)
if %errorlevel% equ 4 (
    goto itemss
)
if %errorlevel% equ 5 (
    goto saves2
)
if %errorlevel% equ 6 (
    goto rabf
)

:pets
cls
set /a rnd=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%10
set /a rndb2=%random% %%25
set /a rndc=%random% %%30
set /a rndd=%random% %%28
echo You petted %fname% and it dropped %rnd%
echo %fname% recovered %rndb% sanity and got %rnd%$!
set /a money=%money% + %rnd%
set /a fsanity=%fsanity% + %rndb%
echo My money is now %money%$
echo %fname%'s sanity is now %fsanity%
if %rnda%==0 (
    pause
goto saves
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb2%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndd%
)

pause
goto saves

pause
set /a factions=%factions% + 1
goto save

:fullbowls
cls
set /a rnd1=%random% %%30
set /a rnda=%random% %%3
set /a rndb=%random% %%23
set /a rndc=%random% %%27
if %playerhasfood%==0 (
   echo [!] You don't have food to full the bowl
   if %rnda%==0 (
pause
goto saves
)
if %rnda%==1 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased %rndb%
)
if %rnda%==2 (
    set /a fhunger=%fhunger% - %rndb%
    echo [!] %fname%'s hunger has decreased by %rndb%
    set /a fsanity=%fsanity% - %rndc%
    echo [!] %fname%'s sanity has decreased by %rndc%
)
   pause
   goto saves
)
if %playerhasfood%==1 (
   echo You filled %fname%'s bowl
   echo and he ate it... %fname% recovered %rnd1% hunger
   set /a fhunger=%fhunger% + %rnd1%
   set playerhasfood=0
   pause
   set /a factions=%factions% + 1
   goto saves
)

:items
cls

::Shop related stuff here !!
:shops
cls
set product=None
echo                   Shop
echo --------------------------------------------
echo 1) Return
echo 2) Food (57$)
echo 3) Sanity pills (310$)
echo 4) Milk (97$)
echo 5) Birthday cake (700$)
echo 6) Fop Soda (30$)
echo 7) Tag (534$)
echo --------------------------------------------
echo (Once you've selected something 
echo it will buy automatically
echo without any confirmation screen,
echo if you have the required
echo money, obviously)
echo.
choice /c 1234567 /m "What do you want buy? "
if %errorlevel% equ 1 (
    goto games
)
::Food
if %errorlevel% equ 2 (
    if %playerhasfood%==1 (
        cls
        echo [!] You already have food.
        pause
        goto shops
    )
    if %playerhasfood%==0 (
        if %money% GEQ 57 (
        cls
        echo You bought the item "Food", now you can
        echo fill %fname% bowl!
        set playerhasfood=1
        set /a money=%money% - 57
        pause
        goto saves
    )
    if %money% LSS 57 (
        cls
        echo You don't have enough money
        echo to buy the item "Food"!
        pause
        goto shops
    )
    )
        
)
::Sanity pills
if %errorlevel% equ 3 (
    if %sanityPills%==1 (
        cls
        echo [!] You already have Sanity pills.
        pause
        goto shops
    )
    if %sanityPills%==0 (
        if %money% GEQ 310 (
        cls
        echo You bought the item "Sanity pills", now you can
        echo give them to %fname% to increase his sanity
        set sanityPills=1
        set /a money=%money% - 310
        pause
        goto saves
    )
    if %money% LSS 310 (
        cls
        echo You don't have enough money
        echo to buy the item "Sanity pills"!
        pause
        goto shops
    )
    )
)
::Milk
if %errorlevel% equ 4 (
    if %milk%==1 (
        cls
        echo [!] You already have Milk.
        pause
        goto shops
    )
    if %milk%==0 (
        if %money% GEQ 97 (
        cls
        echo You bought the item "Milk", this works like Food
        echo but it can make %fname% to recover up to 60
        echo hunger instead of 30!
        set milk=1
        set /a money=%money% - 97
        pause
        goto saves
    )
    if %money% LSS 97 (
        cls
        echo You don't have enough money
        echo to buy the item "Milk"!
        pause
        goto shops
    )
    )
)
::Birthday cake
if %errorlevel% equ 5 (
    if %birthdayCake%==1 (
        cls
        echo [!] You already have a Birthday cake.
        pause
        goto shops
    )
    if %birthdayCake%==0 (
        if %money% GEQ 700 (
        cls
        echo You bought the "Birthday cake", this will make
        echo %fname% age 2 years, it also will be able
        echo to recover 67 hunger.
        set birthdayCake=1
        set /a money=%money% - 700
        pause
        goto saves
    )
    if %money% LSS 700 (
        cls
        echo You don't have enough money
        echo to buy the "Birthday cake"!
        pause
        goto shops
    )
    )
)
::Fop Soda
if %errorlevel% equ 6 (
    if %fopsoda%==1 (
        cls
        echo [!] You already have a Fop Soda.
        pause
        goto shops
    )
    if %birthdayCake%==0 (
        if %money% GEQ 30 (
        cls
        echo You bought the "Fop Soda", this will heal
        echo             %fname% by 5
        set fopsoda=1
        set /a money=%money% - 30
        pause
        goto saves
    )
    if %money% LSS 30 (
        cls
        echo You don't have enough money
        echo to buy the "Fop Soda"!
        pause
        goto shops
    )
    )
)
::Tag
if %errorlevel% equ 7 (
    if %tag%==1 (
        cls
        echo [!]You already have a Tag.
        pause
        goto shops
    )
    if %tag%==0 (
        if %money% GEQ 534 (
        cls
        echo You bought the "Tag", now you can
        echo rename %fname% to whatever you want!
        set tag=1
        set /a money=%money% - 534
        pause
        goto saves
    )
    if %money% LSS 534 (
        cls
        echo You don't have enough money
        echo to buy the "Tag"!
        pause
        goto shops
    )
    )
)
goto shops

::Items select menu

:itemss
set /a rndBeast=%random% %%1500
set /a rnd2=%random% %%30
cls
echo        Items
echo -----------------------
echo 1) Return
echo 2) Sanity pills
echo 3) Milk
echo 4) Birthday Cake
echo 5) Mr.Beast event ticket
echo 6) Fop Soda
echo 7) Tag
echo -----------------------
echo        Stats
echo  H=%fhunger% S=%fsanity% A=%fage% $=%money%
echo       Health=%health%
echo.

choice /c 1234567
if %errorlevel% equ 1 (
    goto game
)
::Sanity pills
if %errorlevel% equ 2 (
    if %sanityPills%==1 (
        cls
        echo You gave %fname% the
        echo "Sanity pills" and he ate them,
        echo He recovered 58 of his sanity!
        set /a fsanity=%fsanity% + 58
        set sanityPills=0
        pause
        goto save
    )
    if %sanityPills%==0 (
        cls
        echo You don't have any "Sanity Pills"!
        pause
        goto items
    )
)
::Milk
if %errorlevel% equ 3 (
    if %milk%==1 (
        cls
        echo You gave %fname% the Milk
        echo and he drank it... %fname%
        echo recovered %rnd2% hunger
        set /a fhunger=%fhunger% + %rnd2%
        set milk=0
        pause
        set /a factions=%factions% + 1
        goto save
    )
    if %milk%==0 (
        cls
        echo You don't have "Milk"!
        pause
        goto items
    )
)
::Birthday cake
if %errorlevel% equ 4 (
    if %birthdayCake%==1 (
        cls
        echo You gave %fname% the Birthday
        echo cake and sing happy birthday two
        echo times in a row, this made %fname%
        echo age 2 years, an also made him to 
        echo recover 67 hunger!
        set /a fhunger=%fhunger% + 67
        set birthdayCake=0
        pause
        set /a fage=%fage% + 2
        goto save
    )
    if %birthdayCake%==0 (
        cls
        echo You don't have a "Birthday cake"!
        pause
        goto items
    )
)
::Mr beast ticket
if %errorlevel% equ 5 (
    if %mrbeastticket%==1 (
        cls
        echo You sent %fname% to a Mr.Beast event,
        echo and he won %rndBeast%$, got %rndBeast%$
        set /a money=%money% + %rndBeast%
        pause
        goto save
    )
    if %mrbeastticket%==0 (
        cls
        echo You don't have a Ticket for the Mr.Beast event
        pause
        goto items
    )
)
::Fop Sodas
if %errorlevel% equ 6 (
    if %fopsoda%==1 (
        cls
        echo You gave %fname% the Fop Soda
        echo and he drank it, Your Floppa healed
        echo            5 health
        set /a health=%health% + 5
        pause
        goto save
    )
    if %fopsoda%==0 (
        cls
        echo You don't have a Fop Soda
        pause
        goto items
    )
)
::Tag (Rename item)
if %errorlevel% equ 7 (
    if %tag%==1 (
        goto nameTagFloppas
    )
    if %tag%==0 (
        cls
        echo You don't have a Tag
        pause
        goto items
    )
)
:nameTagFloppas
        cls
        echo You decided to rename your Floppa
        echo by using the Tag, how do you want
        echo          to call him?
        echo ----------------------------------
        echo Please don't use spaces or unicode
        echo characters or the game could crash
        echo.
        set /p nameInput="Your Floppa new name > "
        set fname=%nameInput%
        pause
        cls
        echo You changed your Floppa name to
        echo %fname% !
        set tag=0
        pause
        goto saves


::Events
:travBanditss
set /a damageBandits=%random% %%13
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo [!] Some bandits entered into your house and
    echo        and hurted %fname%!
    echo %fname% lost %damageBandits% health...
    set /a health=%health% - %damageBandits%
    echo.
    pause
    goto saves
)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto saves
)

:travMrbticks
cls
echo Someone knocked at your door,
echo      Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo  is selling you a ticket for the
    echo    Mr.Beast event for only 700$
    echo        Would you accept it?
    echo.
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 700 (
            cls
            echo You accepted the traveller's offer and
            echo bought the ticket for the Mr.Beast event,
            echo you can use it to make %fname% go to
            echo  a Mr.Beast event and win up to 1500$
            set /a money=%money% - 700
            set mrbeastticket=1
            pause
            goto saves
        )
        if %money% LSS 700 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye fella!"
            pause
            goto saves
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto saves
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto saves
)
::Birthday cake traveller offer
:travcakes
cls
echo Someone knocked at your door,
echo Open the door?
echo      1) Yes 2) No
echo.
choice /c 12 /m "Yes or no? "
if %errorlevel% equ 1 (
    cls
    echo You open the door.
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door..
    timeout /t 1 /nobreak > nul
    cls
    echo You open the door...
    timeout /t 1 /nobreak > nul
    cls
    echo A traveller steped into your house and
    echo is selling you a Birthday Cake for only
    echo     437$, Would you accept it?
    echo             1-Yes 2-No
    choice /c 12 /m "Yes or No? "
    if %errorlevel% equ 1 (
        if %money% GEQ 437 (
            cls
            echo You accepted the traveller's offer and
            echo bought the Birthday Cake, you can use it to
            echo   age %fname% by 2 and sing him
            echo   happy birthday two times in a row
            echo      and recover him 67 hunger
            set /a money=%money% - 437
            set birthdayCake=1
            pause
            goto saves
        )
        if %money% LSS 437 (
            cls
            echo You say to the traveller that you don't
            echo have enough money to accept his offer,
            echo  then he leaves your house saying you
            echo            "Goodbye baka!"
            pause
            goto saves
        )
    
    )
    if %errorlevel% equ 2 (
        cls
        echo You say the traveller that you are
        echo not interested on it's offer, then
        echo  you ask him to leave your house,
        echo         and he proceeds
        pause
        goto saves
    )

)
if %errorlevel% equ 2 (
    cls
        echo You decided not opening the door, 
        echo whoever who was there decided to
        echo       go away in silent...
        pause
        goto saves
)

::Game over!
:gameovers
if %fsanity% LEQ 0 (
    set fsanity=0
)
if %fhunger% LEQ 0 (
    set fhunger=0
)
cls
if %score% GTR %bestscore% (
    set bestscore=%score%
    echo       New best!
) else (
    echo.
)
echo       GAME OVER!
echo.
echo %currentDM%
echo -----------------------
echo        Stats:
echo   Floppa age = %fage%
echo  Floppa sanity = %fsanity%
echo  Floppa hunger = %fhunger%
echo  Floppa health = %health%
echo     Score = %score%
echo  Best score = %bestscore%
echo -----------------------
echo 1) Go to main menu
echo.
choice /c 1
if %errorlevel% equ 1 (
    goto savesbc
)

::Save system related stuff
:savesbc
set bestscore=%bestscore%
(
    echo %bestscore%
)> UserDatas/stats/bestSc.fdata
goto rabf

:saves
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set money=%money%
set playerhasfood=%playerhasfood%
set score=%score%
set currentDM=%currentDM%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata

goto thegame

:saves2
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set money=%money%
set playerhasfood=%playerhasfood%
set score=%score%
set currentDM=%currentDM%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata

echo The game was saved correctly!

pause
goto thegame

:gvsaves1
cls
set health=%health%
set fhunger=%fhunger%
set fsanity=%fsanity%
set fage=%fage%
set factions=%factions%
set money=%money%
set playerhasfood=%playerhasfood%
set score=%score%
set currentDM=%currentDM%
set sanityPills=%sanityPills%
set milk=%milk%
set birthdayCake=%birthdayCake%
set mrbeastticket=%mrbeastticket%
set fopsoda=%fopsoda%

(
echo %health%
echo %fhunger%
echo %fsanity%
echo %fage%
echo %factions%
echo %money%
echo %playerhasfood%
echo %score%
echo %currentDM%
echo %sanityPills%
echo %milk%
echo %birthdayCake%
echo %mrbeastticket%
echo %fopsoda%
)> UserDatas/stats/slot%selectedSlot%/data.fdata
::Best score save
set bestscore=%bestscore%
(
echo %bestscore%
)> UserDatas/stats/bestSc.fdata
goto gameovers
