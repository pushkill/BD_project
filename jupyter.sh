#!/bin/bash
#SBATCH --output=jupyter.log
#SBATCH --error=jupyter.err
#SBATCH --nodes=1
#SBATCH --ntasks=1

port="${1:-$(( RANDOM % 40000 + 10000 ))}"

module load Anaconda3
source activate bd_project

echo "Create the tunnel with:"
echo "ssh -L ${port}:$SLURMD_NODENAME:${port} <HPC login node>"

jupyter notebook --no-browser --ip=0.0.0.0 --port="${port}" --notebook-dir ~/BD_project
