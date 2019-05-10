# Downloading data from dbGaP (IN PROGRESS)

Here are some simple scripts for downloading SRA files from dbGaP. Adapted from [Hurwitz Lab](https://github.com/hurwitzlab/download-dbgap) for Phoenix HPC.

## How to get data from dbGaP

After the access request has been granted, you will need to download the data from dbGaP. If you are not the PI, you will need the PI to get you downloader access to the data. For more instructions, visit this [ncbi](https://www.ncbi.nlm.nih.gov/books/NBK36439/) document. 

1) Download the repository key and move it to $FASTDIR on phoenix. After following the instructiions from the ncbi guide, download the cart file with your selected files and move to $FASTDIR. 

2) Run the ```get_dbgap.sh``` script. This script will create the main repository that allows you to download from the cart file. This script also contains the `prefetch` command which works with bulk download from cart files. 





### Some helpful documents
* [Fastq-dump by Edwards lab](https://edwards.sdsu.edu/research/fastq-dump/)
