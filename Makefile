FC=gfortran
FFLAGS=
BUILD_DIR=build
SRC_DIR=src
LIBS_DIR=libs

.phony: all main clean always

all: always main

main:
	cd $(LIBS_DIR)/f90getopt; $(FC) -c f90getopt.F90
	$(FC) $(FFLAGS) $(SRC_DIR)/main.f90 -o $(BUILD_DIR)/fcc -I./$(LIBS_DIR)/f90getopt/



always:
	mkdir -p $(BUILD_DIR)
	mkdir -p $(BUILD_DIR)/include

clean:
	rm -rf $(BUILD_DIR)