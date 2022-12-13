!/bin/bash
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

echo "Downloading RNAseq reads"
bash scripts/getRNAseq.sh data/				#Retrieves raw sequence reads
