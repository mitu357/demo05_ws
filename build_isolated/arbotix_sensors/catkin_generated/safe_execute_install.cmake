execute_process(COMMAND "/home/zhuwencheng/demo05_ws/build_isolated/arbotix_sensors/catkin_generated/python_distutils_install.sh" RESULT_VARIABLE res)

if(NOT res EQUAL 0)
  message(FATAL_ERROR "execute_process(/home/zhuwencheng/demo05_ws/build_isolated/arbotix_sensors/catkin_generated/python_distutils_install.sh) returned error code ")
endif()
