#!/bin/bash

#SBATCH -A robinson
#SBATCH -p batch
#SBATCH -n 18
#SBATCH -N 1
#SBATCH --time=03-00:00
#SBATCH --mem=60GB

# notification configuration
#SBATCH --mail-type=END
#SBATCH --mail-type=FAIL
#SBATCH --mail-user=urwah.nawaz@adelaide.edu.au ### change to your email

### modules needed 
module load  Aspera-Connect/3.8.3
module load SRA-Toolkit/2.8.2-1-centos_linux64

# repository encryption key
export KEY="prj_21432_D23645.ngc"  ## change to your repository key

#cart file
export CART="cart_prj21432_201905062302.krt"  # change to your cart file

# log dir
export LOG="/fast/users/a1654797/gtex_data" 
touch $LOG/dbgap_download.log

export DIR="/fast/users/a1654797/dbGaP"

 if [ ! -d "$DIR" ]; then
     mkdir -p $DIR
 fi

# scripts need to be ran from the directory where the encryption key will be imported
cd $DIR

#Downloading Gtex data

# importing the key repository 
vdb-config --import $KEY ./ &>$LOG/out/dbgap_download.log

# all codes must be executed from the key repository to get the data

prefetch ../$CART \
&>>$LOG/out/dbgap_download.log
