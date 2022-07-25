#!/bin/sh

if [ -n "$DESTDIR" ] ; then
    case $DESTDIR in
        /*) # ok
            ;;
        *)
            /bin/echo "DESTDIR argument must be absolute... "
            /bin/echo "otherwise python's distutils will bork things."
            exit 1
    esac
fi

echo_and_run() { echo "+ $@" ; "$@" ; }

echo_and_run cd "/home/zhuwencheng/demo05_ws/src/arbotix_ros/arbotix_sensors"

# ensure that Python install destination exists
echo_and_run mkdir -p "$DESTDIR/home/zhuwencheng/demo05_ws/install_isolated/lib/python3/dist-packages"

# Note that PYTHONPATH is pulled from the environment to support installing
# into one location when some dependencies were installed in another
# location, #123.
echo_and_run /usr/bin/env \
    PYTHONPATH="/home/zhuwencheng/demo05_ws/install_isolated/lib/python3/dist-packages:/home/zhuwencheng/demo05_ws/build_isolated/arbotix_sensors/lib/python3/dist-packages:$PYTHONPATH" \
    CATKIN_BINARY_DIR="/home/zhuwencheng/demo05_ws/build_isolated/arbotix_sensors" \
    "/usr/bin/python3" \
    "/home/zhuwencheng/demo05_ws/src/arbotix_ros/arbotix_sensors/setup.py" \
     \
    build --build-base "/home/zhuwencheng/demo05_ws/build_isolated/arbotix_sensors" \
    install \
    --root="${DESTDIR-/}" \
    --install-layout=deb --prefix="/home/zhuwencheng/demo05_ws/install_isolated" --install-scripts="/home/zhuwencheng/demo05_ws/install_isolated/bin"
