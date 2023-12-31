#!/bin/bash
#SBATCH --partition=short		#Creates a batch with the specified partition type (short has the longest time)
#SBATCH --job-name=assembleTranscriptome	#Specifies the name of the batch job
#SBATCH --time=04:00:00			#Time allocated to running the batch job
#SBATCH -N 1				#Number of nodes
#SBATCH -n 32				#Number of tasks per node
#SBATCH --mem=100gb
#SBATCH --output="batch-%x-%j.output"	#Outputs the batch results to the /home/user.name/ directory

echo "Starting analysis"

echo "Loading Anaconda env"
module load anaconda3/2021.11		#Loads the anaconda modules for python
source activate BINF-12-2021		#Loads the dependencies from /BINF-12-2021
module load samtools/1.10

#User defined options:
#The following sets the pipeline to retrieve SRR12549440 through SRR12549452
srrNum=SRR125494 # SRR identifier without last two digits
srrRangeMin="40" # First file in SRR number range
srrRangeMax="52" # Last file in SRR number range

echo "Downloading RNAseq reads"
bash scripts/getRNAseq.sh data/	$srrNum	$srrRangeMin $srrRangeMax	#Retrieves raw sequence reads

echo "Trimming RNAseq reads"          #Trims RNA seq reads
bash scripts/trimAll.sh data/

echo "Starting De Novo Assembly $(date)"
echo "Assemble the De Novo Transcriptome $(date)"
bash scripts/trinityDeNovo.sh data/ results/ $srrNum 1>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinityDeNovo.log 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinityDeNovo.err

echo "Analyze the De Novo Transcriptome $(date)"
bash scripts/analyzeTrinityDeNovo.sh results/ 1>results/$SLURM_JOB_NAME-$SLURM_JOB_ID-trinity_de_novo_stats.txt 2>results/logs/$SLURM_JOB_NAME-$SLURM_JOB_ID-analyzeTrinityDeNovo.err

echo "De Novo Assembly complete $(date)"
