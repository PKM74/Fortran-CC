cmake_minimum_required(VERSION 3.14.0)
project(fcc
    LANGUAGES Fortran
        DESCRIPTION "C Compiler written completely in Fortran"
)

set(FVERSION "-std=f2023")

set(CMAKE_Fortran_FLAGS "${CMAKE_Fortran_FLAGS} ${FVERSION}")

include_directories(BEFORE SYSTEM /usr/include /usr/include/fortran_stdlib/GNU-15.1.1/)
link_directories(BEFORE $ENV{LD_LIBRARY_PATH} ${CMAKE_BINARY_DIR}/ )

include(GNUInstallDirs)

enable_language(Fortran)

set(MODULES   src/tokenizer.f90
              src/fileread.f90
              CACHE INTERNAL "")

add_library(f90getopt SHARED libs/f90getopt/f90getopt.F90)

add_subdirectory(libs/vector ${CMAKE_CURRENT_BINARY_DIR}/vector)

add_library(${PROJECT_NAME}-lib SHARED ${MODULES})

add_executable(${PROJECT_NAME} src/main.f90)

find_package("fortran_stdlib" REQUIRED)
find_package(BLAS)
find_package(LAPACK)

target_link_libraries(
    ${PROJECT_NAME}
    PUBLIC
    f90getopt
    fortran-vector
    ${PROJECT_NAME}-lib
    PRIVATE
    fortran_stdlib::fortran_stdlib
)