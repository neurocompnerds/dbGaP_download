#!/bin/bash                                                                                                                                                                                                                                                                    

#SBATCH -A robinson                                                                                                                                                                                                                                                            
#SBATCH -p batch                                                                                                                                                                                                                                                               
#SBATCH -n 20                                                                                                                                                                                                                                                                  
#SBATCH -N 1                                                                                                                                                                                                                                                                  
#SBATCH --time=3-00:00                                                                                                                                                                                                                                                        
#SBATCH --mem=8GB                                                                                                                                                                                                                                                             

# notification configuration                                                                                                                                                                                                                                                   
#SBATCH --mail-type=END                                                                                                                                                                                                                                                        
#SBATCH --mail-type=FAIL                                                                                                                                                                                                                                                       
#SBATCH --mail-user=urwah.nawaz@adelaide.edu.au                                                                                                                                                                                                                       

module load SRA-Toolkit/2.9.0

export WD="/hpcfs/users/${USER}/dbGaP_download"

export DIR="/hpcfs/users/${USER}/dbGaP_download/files"

if [ ! -d "$DIR" ]; then
    echo "Wrong directory!"
    exit 1
fi

cd $DIR


#check that all files are decrypted                                                                                                                                                                                                                                           
vdb-decrypt *

