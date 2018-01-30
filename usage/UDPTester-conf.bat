@echo off
rem *** -*- batch file -*- ******************************************************
rem *                                                                          **
rem *  UDP Test Configuration                      **
rem *                                                                          **
rem *****************************************************************************

rem Java Home
rem It overrides system JAVA_HOME if set
SET TEST_JAVA_HOME=


rem Test Bind Address
rem The IP address Your Test Server
rem Do not use 0.0.0.0 or 127.0.0.1,should not empty.
SET TEST_BIND_ADDRESS=




rem Test multicast address
rem IP Address used for IP multicast in cluster. 
rem Should not empty,default value is 230.0.0.4 
SET TEST_MULTICAST_ADDRESS=


rem Test multicast Binding Port
rem Should not empty,default value is 45688
SET TEST_MULTICAST_SOCKET_BINDING_PORT=