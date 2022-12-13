#!/bin/bash
#SBATCH --partition=short		#Creates a batch with the specified partition type (short has the longest time)
#SBATCH --job-name=assembleGenome	#Specifies the name of the batch job
#SBATCH --time=04:00:00			#Time allocated to running the batch job
#SBATCH -N 1				#Number of nodes
#SBATCH -n 1				#Number of tasks per node
#SBATCH --output="batch-%x-%j.output"	#Outputs the batch results to the /home/user.name/ directory

echo "Starting analysis"

echo "Loading Anaconda env"
module load anaconda3/2021.11		#Loads the anaconda modules for python
source activate BINF-12-2021		#Loads the dependencies from /BINF-12-2021
module load samtools/1.10

echo "Downloading RNAseq reads"
bash scripts/getRNAseq.sh data/				#Retrieves raw sequence reads

echo "Trimming RNAseq reads"          #Trims RNA seq reads
bash scripts/trimAll.sh data/	

echo "Starting De Novo Assembly $(date)"
echo "Assemble the De Novo Transcriptome $(date)"
bash scripts/trinityDeNovo.sh data/ 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinityDeNovo.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinityDeNovo.err

echo "Analyze the De Novo Transcriptome $(date)"
bash scripts/analyzeTrinityDeNovo.sh data/ 1>results/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinity_de_novo_stats.txt 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-analyzeTrinityDeNovo.err

echo "De Novo Assembly complete $(date)"
