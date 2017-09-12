#!/bin/bash

JENKINS_HOME=/var/jenkins
case "$1" in
    start)
        echo "Starting Jenkins: "
        pid=`ps -ef | grep jenkins.war | grep -v grep | wc -l`
        if [ $pid -gt 0 ]; then
            echo "Jenkins is already running"
            exit 1
        fi
        su - jenkins -c "$JENKINS_HOME/start-jenkins.sh"
        RETVAL=$?
        [ $RETVAL == 0 ] &&
            echo "Jenkins was started successfully." ||
            echo "There was an error starting Jenkins."
        ;;
    stop)
        echo "Stopping Jenkins: "
        pid=`ps -ef | grep jenkins.war | grep -v grep | wc -l`
        if [ ! $pid -gt 0 ]; then
            echo "Jenkins is not running"
            exit 1
        fi
        su - jenkins -c "$JENKINS_HOME/stop-jenkins.sh"
        RETVAL=$?
        [ $RETVAL == 0 ] &&
            echo "Jenkins was stopped successfully." ||
            echo "There was an error stopping Jenkins."
        ;;
    restart)
        $0 stop
        sleep 3
        $0 start
        ;;
    status)
        pid=`ps -ef | grep jenkins.war | grep -v grep | wc -l`
        if [ $pid -gt 0 ]; then
            echo "Jenkins is running"
        else
            echo "Jenkins is stopped"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
esac

exit 0