#!/bin/bash

# Request resources:
#SBATCH -c 1           # 1 CPU core
#SBATCH --mem=1G       # memory required, up to 250G on standard nodes.
#SBATCH --gres=tmp:1G  # temporary disk space required on the compute node ($TMPDIR), up to 400G
#SBATCH --time=1:0:0   # time limit for job (format:  days-hours:minutes:seconds)

# Run in the 'shared' queue (job may share node with other jobs)
#SBATCH -p shared

# Commands to be run:
for size in 1kB 2kB 4kB; do
  echo $size $(likwid-bench -t sum_sp -w N:$size:1 2> /dev/null | grep MFlops/s | cut -f 3)
done