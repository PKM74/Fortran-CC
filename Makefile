FC=gfortran
FFLAGS=-std=f2008 -fdec-structure
BUILD_DIR=build
SRC_DIR=src
LIBS_DIR=libs
INCLUDE_DIR=/usr/include/

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
	$(FC) $(FFLAGS) $(LIBS_FORTRAN) $(SOURCES_FORTRAN) -o $(BUILD_DIR)/fcc -I$(INCLUDE_DIR)



always:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)
	rm $(wildcard *.mod)