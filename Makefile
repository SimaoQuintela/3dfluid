CPP = g++ -O2 -g -fno-omit-frame-pointer -Wall
SRCS = main.cpp fluid_solver.cpp EventManager.cpp
CPP2 = g++ -O3 -g -fno-omit-frame-pointer -Wall -mavx -funroll-loops -floop-block -floop-parallelize-all -fverbose-asm -ftree-vectorize -fopt-info-vec  -fopt-info-vec-missed

OUTPUT_DIR="output_${SLURM_JOB_NAME}_${SLURM_JOB_ID}"

all:
	$(CPP) $(SRCS) -o fluid_sim

fast:
	$(CPP2) $(SRCS) -o fluid_sim

batch:  
	@mkdir -p $(OUTPUT_DIR)
	srun --exclusive --partition=cpar perf stat -r 5 -d ./fluid_sim > $(OUTPUT_DIR)/fluid_sim_${SLURM_JOB_ID}.out 2> $(OUTPUT_DIR)/fluid_sim_${SLURM_JOB_ID}.err

clean:
	@echo Cleaning up...
	@rm fluid_sim
	@echo Done.