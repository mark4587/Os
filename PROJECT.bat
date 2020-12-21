@ECHO OFF
cls
ECHO Program Purpose: To list files starting with M, have an extenstion of .Exe and on C drive
ECHO Author: David Darigan and Mark Doyle
ECHO Date Written: To be entered

ECHO Hello %USERNAME% , You're currently looged into %COMPUTERNAME%
ECHO The Time is %TIME%
ECHO The Date is %DATE%
ECHO =======================================================================
ECHO %USERNAME% , What would you like to do today? 
ECHO =======================================================================
 
ECHO 1: Display User/PC Information
ECHO 2: Check/Create A Directory Structure
ECHO 3: Create Logfile
ECHO 4: Backup Logfile
ECHO 5: File Comparison
ECHO 6: View File Attributes
ECHO 7: View Folder Permissions
ECHO 8: List Non-System Processes
ECHO 9: EXIT

CHOICE /C 987654321 /M "Please select an option"
IF ERRORLEVEL 9 GOTO EXIT
IF ERRORLEVEL 8 GOTO List Non-System processes
IF ERRORLEVEL 7 GOTO View Folder Permissions 
IF ERRORLEVEL 6 GOTO View File attributes
IF ERRORLEVEL 5 GOTO File Comparison 
IF ERRORLEVEL 4 GOTO Backup Logfile
IF ERRORLEVEL 3 GOTO Create Lofile
IF ERRORLEVEL 2 Check/Create A Directory Structure
IF ERRORLEVEL 1 Display User/PC Information

 :Display User/PC Information
 ECHO As you know today's time and date is,
 ECHO %Time%
 ECHO %DATE%
 ECHO Your System Information is:
 ECHO systeminfo /?
 GOTO end
 

 :Check/Create A Directory Structure 
 ECHO The Directory Structure that we'll be working with today is,
 ECHO C:\batch\logs
 ECHO C:\backup\logs
 ECHO Would you like to see if this exits,
 CHOICE /C YN

