# meta-aeroboard/recipes-gui/gui-app-init/files/gui-app-init.sh
#!/bin/sh
### BEGIN INIT INFO
# Provides:          gui-app
# Required-Start:    $local_fs $remote_fs
# Required-Stop:     $local_fs $remote_fs
# Default-Start:     2 3 4 5
# Default-Stop:      0 1 6
# Short-Description: GUI Application
### END INIT INFO

APP=/usr/bin/gui-app
PIDFILE=/var/run/gui-app.pid
LOGFILE=/var/log/gui-app.log

export QT_QPA_PLATFORM=eglfs
export QT_QPA_EGLFS_INTEGRATION=eglfs_kms_egldevice
export XDG_RUNTIME_DIR=/tmp/runtime-root

prepare() {
    mkdir -p /tmp/runtime-root
    chmod 700 /tmp/runtime-root
}

case "$1" in
    start)
        echo "Starting gui-app..."
        prepare
        start-stop-daemon -S -b -m -p $PIDFILE \
            -x $APP >> $LOGFILE 2>&1
        echo "OK"
        ;;
    stop)
        echo "Stopping gui-app..."
        start-stop-daemon -K -p $PIDFILE
        rm -f $PIDFILE
        echo "OK"
        ;;
    restart)
        $0 stop
        sleep 1
        $0 start
        ;;
    status)
        if [ -f $PIDFILE ] && kill -0 $(cat $PIDFILE) 2>/dev/null; then
            echo "gui-app is running (PID $(cat $PIDFILE))"
        else
            echo "gui-app is not running"
        fi
        ;;
    *)
        echo "Usage: $0 {start|stop|restart|status}"
        exit 1
        ;;
esac

exit 0