Organism: Thermus thermophilus</br>
DNA seq SRR: SRR12549453</br>
RNA seq SRR: SRR12549440</br>

# Final Project

### Author

Sohil Chavan

### Date Created

12/10/2022

## Introduction

### Goal

The main objective of this project is to take in data from DNA seq and linked RNA seq runs on Thermus Thermophilus and use them to assemble a genome, assemble a transcriptome, annotate the assembled transcriptome, and predict known proteins which would likely be expressed by the transcriptome.

### Required Input

No required input files for this project, though the sbatch*.sh pipelines have options that can be defined by the user via a script or text editor. The project directory should contain all four pipeline scripts, along with the scripts folder.

### Required Versions of Resources

This project requires a 64 bit operating system with Python 3, Anaconda 3. Dependencies required by subscripts are located in the BINF-12-2021 directory.

### Expected Output

The output data will be in the created results folder in the project directory with data for some pipelines being located in their own subdirectories within the results directory. The logs are contained within results/logs. Individual pipeline output logs will be stored in the project directory itself in .output format.

## Genome Assembly

### Goal

* The goal of this pipeline is to take in an SRR number for a DNA seq run, download the run, trim the reads, assemble the genome from reads, check the assembly quality/accuracy, then build a reference database from the assembly.

### Required Input

* To run the pipeline:
```
sbatch sbatch_genomeAssembly.sh
```

### Required Versions of Resources (Any version after 12-2021 as found in BINF6308 directory)

* SPAdes genome assembler v3.15 or later
* QUAST v.5.0.0 or later
* Latest version of GMAP

### Expected Output

* Spades outputs the assembled genome to the data/thermo directory
  * The contigs.fasta is used to build the reference database which can be used for optional GSNAP alignment
* Quast outputs to its own quast_results in the project directory
* The reference database is built in the ThermusGenomeDb folder in data/

## Transcriptome Assembly

### Goal

* The goal of this pipeline is to download SRR runs on an RNA seq experiment on Thermus Thermophilus, trim the reads, generate a de novo transcriptome assembly, then analyze the assembled results.

### Required Input

* To run the pipeline:
```
sbatch sbatch_transcriptomeAssembly.sh
```

### Required Versions of Resources (Any version after 12-2021 as found in BINF6308 directory)

* Trinity release v2.13 or later

### Expected Output

* Output transcriptome assembly located in results/trinity_de_novo

## Transcriptome Annotation

### Goal

* The goal of this pipeline is to take in an assembled transcriptome and perform a protein structure/function analysis. The objective is to annotate the transcriptome with recognizable markers for known protein domains.

### Required Input

* Required input is the result of the trinity de novo assembly in .fasta format, though the pipeline automatically copies the trinity_de_novo folder from the results to the data directory
* To run the pipeline:
```
sbatch sbatch_transdecoder.sh
```

### Required Versions of Resources (Any version after 12-2021 as found in BINF6308 directory)

* Trinity release v2.13 or later (TransDecoder included with Trinity)
* 

### Expected Output



## Protein Function Prediction

### Goal



### Required Input

* To run the pipeline:
```
sbatch sbatch_IPS.sh
```

### Required Versions of Resources (Any version after 12-2021 as found in BINF6308 directory)



### Expected Output



# References

[1] Bolger, A. M., Lohse, M., & Usadel, B. (2014). Trimmomatic: a flexible trimmer for Illumina sequence data. Bioinformatics, 30(15), 2114–2120. https://doi.org/10.1093/bioinformatics/btu170

[2] Wu, T. D., Reeder, J., Lawrence, M., Becker, G., & Brauer, M. J. (2016). GMAP and GSNAP for Genomic Sequence Alignment: Enhancements to Speed, Accuracy, and Functionality. Methods in Molecular Biology (Clifton, N.J.), 1418, 283–334. https://doi.org/10.1007/978-1-4939-3578-9_15

[3] Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., & Durbin, R. (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25(16), 2078–2079. https://doi.org/10.1093/bioinformatics/btp352

[4] Li, H., Handsaker, B., Wysoker, A., Fennell, T., Ruan, J., Homer, N., Marth, G., Abecasis, G., & Durbin, R. (2009). The Sequence Alignment/Map format and SAMtools. Bioinformatics, 25(16), 2078–2079. https://doi.org/10.1093/bioinformatics/btp352

[5] Haas, B. J., Papanicolaou, A., Yassour, M., Grabherr, M., Blood, P. D., Bowden, J., Couger, M. B., Eccles, D., Li, B., Lieber, M., MacManes, M. D., Ott, M., Orvis, J., Pochet, N., Strozzi, F., Weeks, N., Westerman, R., William, T., Dewey, C. N., … Regev, A. (2013). De novo transcript sequence reconstruction from RNA-seq using the Trinity platform for reference generation and analysis. Nature Protocols, 8(8), 1494–1512. https://doi.org/10.1038/nprot.2013.084

[6] Altschul, S. F., Gish, W., Miller, W., Meyers, E. W., & Lipman, D. J. (1990). Basic Local Alignment Search Tool. Journal of Molecular Biology, 215(3), 403–410. https://doi.org/10.1006/jmbi.1990.9999

[7] Potter, S. C., Luciani, A., Eddy, S. R., Park, Y., Lopez, R., & Finn, R. D. (2018). HMMER web server: 2018 update. Nucleic Acids Research, 46(W1), W200–W204. https://doi.org/10.1093/nar/gky448

[8] TransDecoder. Retrieved from https://github.com/TransDecoder/TransDecoder

[9] Apweiler, R., Attwood, T. K., Bairoch, A., Bateman, A., Birney, E., Biswas, M., Bucher, P., Cerutti, L., Corpet, F., Croning, M. D. R., Durbin, R., Falquet, L., Fleischmann, W., Gouzy, J., Hermjakob, H., Hulo, N., Jonassen, I., Kahn, D., Kanapin, A., … Zdobnov, E. M. (2000). InterPro—an integrated documentation resource for protein families, domains and functional sites. Bioinformatics, 16(12), 1145–1150. https://doi.org/10.1093/bioinformatics/16.12.1145

[10] Jones, P., Binns, D., Chang, H.-Y., Fraser, M., Li, W., McAnulla, C., McWilliam, H., Maslen, J., Mitchell, A., Nuka, G., Pesseat, S., Quinn, A. F., Sangrador-Vegas, A., Scheremetjew, M., Yong, S.-Y., Lopez, R., & Hunter, S. (2014). InterProScan 5: genome-scale protein function classification. Bioinformatics, 30(9), 1236–1240. https://doi.org/10.1093/bioinformatics/btu031
