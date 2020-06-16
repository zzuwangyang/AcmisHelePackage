#!/bin/bash
su - hadoop <<!
case $1 in
start)
sh /hadoop-3.2.1/sbin/start-all.sh
;;
stop)
sh /hadoop-3.2.1/sbin/stop-all.sh
;;
*)
echo "Usage:$0(start|stop)"
;;
esac
exit
!