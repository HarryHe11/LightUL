#!/bin/bash

# Tell the system the resources you need. Adjust the numbers according to your need, e.g.
SBATCH --gres=gpu:1 --cpus-per-task=8 --mail-type=ALL

#If you use Anaconda, initialize it
. $HOME/anaconda3/etc/profile.d/conda.sh
conda activate pytorch

# cd your your desired directory and execute your program, e.g.
cd _to_your_directory_you_need
_run_your_program_