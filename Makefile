CPP = g++ -O2 -g -fno-omit-frame-pointer -Wall
SRCS = main.cpp fluid_solver.cpp EventManager.cpp

CPP2 = g++ -O3 -g -fno-omit-frame-pointer -mavx -mfma -Wall

all:
	$(CPP) $(SRCS) -o fluid_sim

fast:
	$(CPP2) $(SRCS) -o fluid_sim

clean:
	@echo Cleaning up...
	@rm fluid
	@echo Done.                            
