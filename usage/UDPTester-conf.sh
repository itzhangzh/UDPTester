#!/bin/bash
# *** -*- batch file -*- ******************************************************
# *                                                                          **
# *   UDP Test Configuration                         **
# *                                                                          **
# *****************************************************************************

# Java Home
# It overrides system JAVA_HOME if set
TEST_JAVA_HOME=""


# Test Bind Address
# The IP address Your Test Server
# Do not use 0.0.0.0 or 127.0.0.1,should not empty.
TEST_BIND_ADDRESS=""



# Test multicast address
# IP Address used for IP multicast in cluster. 
# Should not empty,default value is 230.0.0.4 
TEST_MULTICAST_ADDRESS=""



# Test multicast Binding Port
# Should not empty,default value is 45688
TEST_MULTICAST_SOCKET_BINDING_PORT=""

