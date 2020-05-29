#!/bin/bash
############################################################
#  Get Gateway Network Status  from /etc/dmrgateway        #
#  $1 1-6 Select Mode to get status of                     #
#                                                          #
#  Returns a String                                        #
#                                                          #
#  VE3RD                                     2020-05-29    #
############################################################
set -o errexit
set -o pipefail

if [ -z "$1" ]; then
  exit
fi

  n1=$(sed -nr "/^\[DMR Network $1\]/ { :l /^Address[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
  n2=$(sed -nr "/^\[DMR Network $1\]/ { :l /^Port[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
  n3=$(sed -nr "/^\[DMR Network $1\]/ { :l /^Password[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)
  n4=$(sed -nr "/^\[DMR Network $1\]/ { :l /^Name[ ]*=/ { s/.*=[ ]*//; p; q;}; n; b l;}" /etc/dmrgateway)


  echo "$n1|$n2|$n3|$n4"



