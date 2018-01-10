cls
@ECHO off
MODE CON: LINES=28 COLS=100

:again
ECHO.
ECHO                                           Fill IP details here

:Static
REM *User input IP Address, Subnet Mask, and Gateway Addresses*
ECHO.
set /P Addy=IP Address:           
set /P Sub_Mask=Subnet Mask:          
set /P GW=Gateway IP Address:   

REM *Get DNS Servers*
set /P DNS_1=Primary DNS Server:   
set /P DNS_2=Secondary DNS Server: 

REM *Set IP, Subnet Mask, and Gateway Addresses* 
netsh interface ip set address "Local Area Connection" static %Addy% %Sub_Mask% %GW% 1

REM *Set DNS Server IP Addresses*
netsh interface ip delete dns "Local Area Connection" all
if not [%DNS_1%]==[] netsh interface ip set dns "Local Area Connection" static %DNS_1%
if not [%DNS_2%]==[] netsh interface ip add dns "Local Area Connection" %DNS_2% index=2
ECHO.
netsh interface ip show config
ECHO.
goto done

:done
ECHO.
ECHO.
set /P Done=Hit enter key when finished: 
cls
:exit

:quit
cls
:exit
