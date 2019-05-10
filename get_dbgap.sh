#!/bin/bash

#SBATCH -A robinson
#SBATCH -p batch
#SBATCH -n 18
#SBATCH -N 1
#SBATCH --time=03-00:00
#SBATCH --mem=120GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

### modules needed 
module load  Aspera-Connect/3.8.3
module load SRA-Toolkit/2.8.2-1-centos_linux64


#encryption key, change to whatever yours is
export KEY="prj_21432_D23645.ngc"

#cart downloaded from dbgap "run browser" container list of files to download

export CART="cart_prj21432_201905062302.krt "

export LOGDIR="/fast/users/a1654797/gtex_data"

export DIR="/fast/users/a1654797/dbGaP"

 if [ ! -d "$DIR" ]; then
     mkdir -p $DIR
 fi

cd $DIR

#Downloading Gtex data

# importing the key repository 
vdb-config --import $KEY ./ &>$LOGDIR/out/dbgap_download.log

# all codes must be executed from the key repository to get the data

prefetch ../$CART \
&>>$LOGDIR/out/dbgap_download_2.log
