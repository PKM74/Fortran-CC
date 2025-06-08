FC=gfortran
FFLAGS=-std=f2023 -fdec-structure
BUILD_DIR=build
SRC_DIR=src
LIBS_DIR=libs
INCLUDE_DIR=/usr/include/fortran_stdlib/GNU-15.1.1/
SYSLIB_DIR=/usr/lib/

STDLIB_CFLAGS := `pkg-config --cflags fortran_stdlib`
STDLIB_LIBS := `pkg-config --libs fortran_stdlib`

SOURCES_FORTRAN = $(wildcard $(SRC_DIR)/*.f90)

LIBS_FORTRAN = $(wildcard $(LIBS_DIR)/*.f90) \
				$(wildcard $(LIBS_DIR)/*/*.f90) \
			  	$(wildcard $(LIBS_DIR)/*/*/*.f90) \
			  	$(wildcard $(LIBS_DIR)/*/*/*/*.f90) \
				$(wildcard $(LIBS_DIR)/*.F90) \
				$(wildcard $(LIBS_DIR)/*/*.F90) \
			  	$(wildcard $(LIBS_DIR)/*/*/*.F90) \
			  	$(wildcard $(LIBS_DIR)/*/*/*/*.F90) \
				$(wildcard $(SRC_DIR)/modules/*.f90) \
				$(wildcard $(SRC_DIR)/modules/*.F90)

.phony: all main clean always

all: always main

main:
	$(FC) $(FFLAGS) $(STDLIB_CFLAGS) $(STDLIB_LIBS) $(LIBS_FORTRAN) $(SOURCES_FORTRAN) -o $(BUILD_DIR)/fcc

always:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
	rm $(wildcard *.mod)
	rm $(wildcard *.smod)