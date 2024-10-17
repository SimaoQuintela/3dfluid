#!/bin/bash

# SBATCH directives (static values)
#SBATCH --job-name=fluid_sim
#SBATCH --partition=cpar
#SBATCH --cpus-per-task=1
#SBATCH --time=01:00:00

# Create a unique folder for the output using the job name and job ID
OUTPUT_DIR="output_${SLURM_JOB_NAME}_${SLURM_JOB_ID}"
mkdir -p $OUTPUT_DIR

# Redirect standard output and error dynamically
srun --partition=cpar perf stat -d ./fluid_sim > $OUTPUT_DIR/fluid_sim_${SLURM_JOB_ID}.out 2> $OUTPUT_DIR/fluid_sim_${SLURM_JOB_ID}.err