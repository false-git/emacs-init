cmake_minimum_required(VERSION 3.5)

set (CMAKE_CXX_STANDARD 17)
set (CMAKE_CXX_EXTENSIONS OFF)
set (CMAKE_CXX_STANDARD_REQUIRED ON)
set (CMAKE_CXX_COMPILER clang++)
set (CMAKE_CXX_FLAGS "-Wall -Wextra -Wno-unknown-pragmas -Ofast")
set (CMAKE_EXPORT_COMPILE_COMMANDS ON)

add_library(hoge STATIC hoge/hoge.cc)
target_include_directories(hoge PUBLIC ${PROJECT_SOURCE_DIR}/include)

add_executable(toplevel toplevel.cc)
target_link_libraries(toplevel hoge)
