# HPC Based Space Ranger and Cell Ranger Pipelines

## 1. Introduction

Space Ranger and Cell Ranger are tools supported by 10X Genomics to generate input files for the downstrain analysis of single cell transcriptomics and Visium spatial transcriptomics.

The HPC based pipelines documented in this repository are able to run Space Ranger and Cell Ranger for single cell transcriptomics, Visium V2 and Visium HD data starting from the fastq files, and they are able to run multiple samples simutenously.

## 2. Dependencies

The scripts are depended on the Slurm system. The cellranger and spaceranger modules are loaded inside the Slurm script. Check the script to see the version of the module and change the version if the current ones are not avaialiable on your HPC.

## 3. Resources

For cellranger, you will need the references of human or mouse genomics. Check the [10X Genomics Cell Ranger Download Center](https://www.10xgenomics.com/support/software/cell-ranger/downloads#reference-downloads) to download the references.

For spaceranger, you will need both the references and the prob sets of human or mouse. Check the [10X Genomics Space Ranger Download Center](https://www.10xgenomics.com/support/software/space-ranger/downloads) to download the references and the prob sets.

## 4. Inputs

### 4.1 Sample sheet

For both cellranger and spaceranger, you will need sample sheets to list the samples. For cellranger, you only need to list the sample names in the sample sheets. If you have 4 samples to run cellranger, so your sample sheet should be like this:

```
sample1
sample2
sample3
sample4
```

Here is a example of a cellranger sample sheet.

For spaceranger, you need to list the sample names, Visium slide ID and the Visium slide area ID (A1 or D1) using "," to separate the 3 items. Visium V2 and Visium HD share the same format of sample sheet. Your sample sheet should be like this:

```
sample1,slideID1,areaID1
sample2,slideID2,areaID2
sample3,slideID3,areaID3
sample4,slideID4,areaID4
```

Here is a example of a spaceranger sample sheet.

### 4.2 Fastqs directory

For both cellranger and spaceranger, you will need a directory to store the fastq files. The  name of your fastq files must start with the sample name you used in the sample sheet. Use "_" to link the sample name and the rest of the fastq file names. If the sample name is "sample1", the fastq file name should be something like this:

```
sample1_S1_R1_001.fastq.gz
```

Store all your fastq files of a cellranger run with the same format of file name in a directory.

### 4.3 Images directory

The images directory is only required for the spaceranger. Skip this part if your are going to run the cellranger. For each sample, you will have 3 files stored in the images directory - a CytAssist tif image, a microscope tif image, and a json manual alignment file. 

The manual alignment is usually needed for running a space ranger. Check [here](https://www.10xgenomics.com/support/software/space-ranger/latest/analysis/inputs/visium-hd-loupe-alignment) to see how to do the manual alignment and generate json files. Manual alignment process for Visium V2 and Visium HD are the same.

For the CytAssist tif image, you must name it 



