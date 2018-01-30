@echo off
rem ### -*- batch file -*- ######################################################
rem #                                                                          ##
rem #  UDP Test Start Script                                                   ##
rem #                                                                          ##
rem #############################################################################

rem execute the configuration script
if "%OS%" == "Windows_NT" (
  set "DIRNAME=%~dp0%"
) else (
  set DIRNAME=.\
)
call "%DIRNAME%UDPTester-conf.bat"


rem override the system JAVA_HOME if it is set in configuration script
IF NOT ["%TEST_JAVA_HOME%"] == [""] (
    SET JAVA_HOME=%TEST_JAVA_HOME%
)



rem prepare start command
SET AP_COMMAND=java -cp  .;lib/jgroups.jar;lib/commons-logging.jar;lib/concurrent-1.3.4.jar UDPTester


IF NOT ["%TEST_BIND_ADDRESS%"] == [""] (
    SET AP_COMMAND=%AP_COMMAND% -bind_addr "%TEST_BIND_ADDRESS%"
)

IF NOT ["%TEST_MULTICAST_ADDRESS%"] == [""] (
    SET  AP_COMMAND=%AP_COMMAND% -mcast_addr "%TEST_MULTICAST_ADDRESS%"
)

IF NOT ["%TEST_MULTICAST_SOCKET_BINDING_PORT%"] == [""] (
    SET AP_COMMAND=%AP_COMMAND% -mcast_port "%TEST_MULTICAST_SOCKET_BINDING_PORT%"
)

CD "%DIRNAME%class"

ECHO %AP_COMMAND% 
%AP_COMMAND% 

:END
if "x%NOPAUSE%" == "x" pause