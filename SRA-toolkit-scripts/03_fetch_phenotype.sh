#!/bin/bash

#SBATCH -A robinson
#SBATCH -p batch
#SBATCH -n 12
#SBATCH -N 1
#SBATCH --time=05:00:00
#SBATCH --mem=20GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@student.adelaide.edu.au

module load  Aspera-Connect/3.8.3
module load SRA-Toolkit/2.8.2-1-centos_linux64


#encryption key, change to whatever yours is
export KEY="prj_21432_D23645.ngc"

#cart downloaded from dbgap "run browser" container list of files to download
export CART="cart_prj21432_201905100219.krt"

export LOGDIR="/fast/users/a1654797/gtex_data"

touch $LOGDIR/dbgap_phenotype.log

export DIR="/fast/users/a1654797/dbGaP-21432"

 if [ ! -d "$DIR" ]; then
     mkdir -p $DIR
 fi

cd $DIR

#Downloading data

prefetch ../$CART \
&>>$LOGDIR/out/dbgap_phenotype.log
