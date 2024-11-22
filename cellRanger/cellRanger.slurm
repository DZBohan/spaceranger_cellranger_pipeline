#!/bin/bash
#SBATCH --nodes=1
#SBATCH --ntasks=1
#SBATCH --cpus-per-task=32
#SBATCH --mem=64GB
#SBATCH --time=8:00:00

module load gcc/11.3.0
module load cellranger/7.0.0


source /path/to/config_sc.txt

SAMPLE=$(sed -n "$SLURM_ARRAY_TASK_ID"p $FILE)

cellranger count --id=${SAMPLE} \
                 --transcriptome=${REFER} \
                 --fastqs=${FASTQS} \
                 --sample=${SAMPLE} \
                 --localcores=${CORES} \
                 --localmem=${MEM}


