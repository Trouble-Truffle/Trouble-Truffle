cmake_minimum_required(VERSION 3.19.0)
set(CMAKE_CXX_STANDARD 17)
project("conWM")

set(SOURCE_FILES 
"Main.cpp"
"Window_Manager.cpp") 

find_package(X11 REQUIRED)
find_package(glog REQUIRED)

add_executable(${PROJECT_NAME} ${SOURCE_FILES})
target_link_libraries(${PROJECT_NAME} X11 glog )
