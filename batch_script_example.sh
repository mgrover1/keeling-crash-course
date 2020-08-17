#!/bin/bash ##Specify the shell from tcsh,bash,zsh etc

#This shell is to process ICON 2.5 km data and obtain TF properties.

#SBATCH -p node ##Options of node, seseml, sesempi, sesebig
#SBATCH -n 20 ##Set number of processors needed for the job
#SBATCH --mem 126GB ##Set total RAM required
#SBATCH --time=4-00:00:00 ##Set time needed for the job
#SBATCH --mail-type=BEGIN ##Specify the type of job execution emails you need like beginning, failing or end of job.
#SBATCH --mail-type=FAIL
#SBATCH --mail-type=END
#SBATCH --mail-user=mailid@illinois.edu ##Specify your email where the information about the execution will be sent.

source ~/anaconda3/bin/activate daskpy ## This is an example of setting the python virtual environment needed for the code.

echo "#####################################################" ##This is to print any info about the job
echo "# Welcome to the ICON processing script"
echo "#####################################################"

###export OMP_NUM_THREADS=1 ##This is to specify how many threads you need per processor.

python Aug01.py ##Execute the program

echo "DONE!"
