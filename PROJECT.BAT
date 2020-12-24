@ECHO OFF
cls
ECHO Program Purpose: To list files starting with M, have an extenstion of .Exe and on C drive
ECHO Author: David Darigan and Mark Doyle
ECHO Date Written: To be entered


:MENU
ECHO =======================================================================
ECHO %USERNAME% , What would you like to do today? 
ECHO =======================================================================
ECHO 1: Display User/PC Information
ECHO 2: Check or Create A Directory Structure
ECHO 3: Create Logfile
ECHO 4: Backup Logfile
ECHO 5: File Comparison
ECHO 6: View File Attributes
ECHO 7: View Folder Permissions
ECHO 8: List Non-System Processes
ECHO 9: EXIT


CHOICE /C 123456789 /M "Please select an option"
IF ERRORLEVEL 9 GOTO ExitProgram
IF ERRORLEVEL 8 GOTO List Non-System processes
IF ERRORLEVEL 7 GOTO View Folder Permissions 
IF ERRORLEVEL 6 GOTO View File attributes
IF ERRORLEVEL 5 GOTO File Comparison 
IF ERRORLEVEL 4 GOTO Backup Logfile
IF ERRORLEVEL 3 GOTO Create Logfile
IF ERRORLEVEL 2 GOTO Check or Create A Directory Structure
IF ERRORLEVEL 1 GOTO Display User/PC Information
 

:Display User/PC Information
REM Get current date, time, the username and computername and store them in the variable message
set message=[%date% : %time% ] Welcome %USERNAME%. You are currently logged onto %COMPUTERNAME%
REM We inform the user of the details
echo %message%
REM Save this information in a log file if it already exists
IF EXIST C:\batch\logs\logfile.txt echo %message% >> C:\batch\logs\logfile.txt
PAUSE
GOTO MENU

:Check or Create A Directory Structure 
 ECHO The Directory Structure that we'll be working with today is,
 ECHO C:\batch\logs
 ECHO C:\backup\logs
 ECHO Would you like to see if this Directory Structure exits?
 CHOICE /C 12 /M "1 = Yes, 2=No" 
 IF ERRORLEVEL 2  GOTO MENU 
 IF ERRORLEVEL 1 GOTO Check

:Check
 IF EXIST C:\batch\logs  ECHO C:\batch\logs already exists
 IF EXIST C:\backup\logs ECHO C:\backup\logs already exists
 IF NOT EXIST  C:\batch\logs  (
 ECHO C:\batch\logs didn't exist before today so I made it for you.      
 MD C:\batch\logs   )       
 IF NOT EXIST  C:\backup\logs (
 ECHO C:\backup\logs didn't exist before today so I made it for you.
 MD C:\backup\logs   )
 PAUSE
 GOTO MENU

:Create Logfile
IF NOT EXIST C:\batch\logs\ (
   ECHO Required directory path C:\batch\logs does not exist. You may create it with option 2.
   REM We cut this off early because the next condition implicitly assumes this path exists
   PAUSE
   GOTO MENU
)
IF NOT EXIST C:\batch\logs\logfile.txt (
   ECHO Creating Logfile
   TYPE nul > C:\batch\logs\logfile.txt
   ECHO Created Logfile
) ELSE (
   ECHO Logfile already exists
)
PAUSE
GOTO MENU
 
:Backup Logfile
 ECHO ===========================================================================================
 ECHO I'm now going to backup the contents of C:\batch\logs folder and place it in C:\backup\logs
 ECHO ===========================================================================================
 XCOPY C:\batch\logs\logfile.txt C:\backup\logs\logifle.txt
 PAUSE  
 GOTO MENU

:File Comparison
 ECHO ====================================
 ECHO Comparing current log to backup log
 ECHO ====================================
 FC C:\batch\logs\logfile.txt C:\backup\logs\logfile.txt
 PAUSE
 GOTO MENU

 :View File Attributes
 ECHO =============================================================================
 ECHO The files/directory structure that we'll be using is C:\batch\logs\logfile.txt
 ECHO =============================================================================
 DIR C:\batch\logs\logfile.txt
 PAUSE
 GOTO MENU

 :View Folder Permissions
 ECHO =============================================================================
 ECHO Viewing Folder Permissions
 ECHO =============================================================================
 REM We cannot check the permissions of a folder that does not exist
 IF NOT EXIST C:\backup (
    ECHO Backup Folder does not exist.
    ECHO You may create it with option 2.
    ECHO Returning to Menu.
    GOTO MENU
 ) ELSE (
    ECHO Viewing Permissions of C:\Backup
    ICACLS C:\Backup
 )
 PAUSE
 GOTO MENU


 :List Non-System Processes
 ECHO ========================================================
 ECHO I'm now going to show you a list of Non-System Processes.
 ECHO ========================================================
 TASKLIST
 PAUSE 
 GOTO MENU

:ExitProgram
 REM We do not want to use the Exit Command because it will quit the command prompt itself.
 REM So instead we just keep this command to the bottom of the file without overtaking..
 REM ..the flow of control and have it end naturally.
 ECHO ================
 ECHO Exiting Program
 ECHO ================
 CHOICE /M "Are you sure you would like to exit "
 IF ERRORLEVEL 2 GOTO MENU
 IF ERRORLEVEL 1 ECHO Exit Confirmed
