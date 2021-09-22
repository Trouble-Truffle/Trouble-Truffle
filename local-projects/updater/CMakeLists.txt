cmake_minimum_required(VERSION 3.19.0)
project(updater)
set(CMAKE_CXX_STANDARD 17)

set(SOURCE_FILES Main.cpp)

add_subdirectory("src")
add_executable(${PROJECT_NAME} ${SOURCE_FILES})

target_link_libraries(${PROJECT_NAME} PUBLIC src_dir)