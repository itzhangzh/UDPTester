#!/bin/bash
### -*- script file -*- #####################################################
#                                                                          ##
#  UDP Test Start Script                                                   ##
#                                                                          ##
#############################################################################

set -e

# retrieve information of current directory
DIRNAME="$( cd "$(dirname "$0")" ; pwd -P )"
AP_START="java -cp  .:lib/jgroups.jar:lib/commons-logging.jar:lib/concurrent-1.3.4.jar UDPTester"

# execute the configuration script
source $DIRNAME/UDPTester-conf.sh

# global variable
AP_TAIL_LINES=30


function start() {
 
  
  # override system JAVA_HOME if it is set in configuration script
  if [[ ! -z $TEST_JAVA_HOME ]]
  then
      export JAVA_HOME="$TEST_JAVA_HOME"
  fi
  
  # prepare start command
  AP_COMMAND=$AP_START
  

  
  if [[ ! -z $TEST_BIND_ADDRESS ]]
  then
      AP_COMMAND="$AP_COMMAND -bind_addr $TEST_BIND_ADDRESS"
  fi
  
  if [[ ! -z $TEST_MULTICAST_ADDRESS ]]
  then
      AP_COMMAND="$AP_COMMAND -mcast_addr $TEST_MULTICAST_ADDRESS"
  fi
  
  if [[ ! -z $TEST_MULTICAST_SOCKET_BINDING_PORT ]]
  then
      AP_COMMAND="$AP_COMMAND -mcast_port $TEST_MULTICAST_SOCKET_BINDING_PORT"
  fi
  
  cd $DIRNAME/class

  echo $AP_COMMAND 

  $AP_COMMAND 
}


case "$1" in
start)
  start
  ;;
*)
  start
esac
