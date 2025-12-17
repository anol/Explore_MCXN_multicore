cmake_minimum_required(VERSION 4.1)

set(PLATFORM "Platform_MCXN")
set(SOURCE_ROOT_DIR "${CMAKE_SOURCE_DIR}/src")
set(PLATFORM_SOURCE_DIR "${SOURCE_ROOT_DIR}/Variant/Platform/${PLATFORM}")
set(GNU_VERSION "13.2.rel1")

include("${PLATFORM_SOURCE_DIR}/${PLATFORM}_toolchain.cmake")

project(Explore_MCXN_multicore)

set(CMAKE_CXX_STANDARD 20)

set(MY_BINARY_DIR "${CMAKE_SOURCE_DIR}/bin")

add_subdirectory("src/Variant/Target/Explore_MCXN_multicore")
