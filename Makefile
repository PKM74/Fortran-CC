FC=gfortran
BUILD_DIR=build
SRC_DIR=src

.phony: all main clean always

all: always main

main:
	$(FC) $(SRC_DIR)/main.f90 -o $(BUILD_DIR)/fcc

always:
	mkdir -p $(BUILD_DIR)

clean:
	rm -rf $(BUILD_DIR)