#!/bin/bash
#SBATCH --job-name=cpu_strs
#SBATCH --output=%x-%A.out
#SBATCH --error=%x-%A.err
#SBATCH -p broadwl
#SBATCH --time=0:10:00

# Here you should modify for your own conda-env
module load Anaconda3/5.0.0.1
source activate parsl-dev

# modify config below program as following points
# - worker_init:  e.g.worker_init='module load Anaconda3/5.0.0.1; source activate py3501'
# - 
python cpu_stress_midway_slurm.py

