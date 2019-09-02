#!/bin/bash                                                                                                                                                                                                                                                                    

#SBATCH -A robinson                                                                                                                                                                                                                                                            
#SBATCH -p batch                                                                                                                                                                                                                                                               
#SBATCH -n 20                                                                                                                                                                                                                                                                  
#SBATCH -N 2                                                                                                                                                                                                                                                                   
#SBATCH --time=3-00:00                                                                                                                                                                                                                                                        
#SBATCH --mem=8GB                                                                                                                                                                                                                                                             

# notification configuration                                                                                                                                                                                                                                                   
#SBATCH --mail-type=END                                                                                                                                                                                                                                                        
#SBATCH --mail-type=FAIL                                                                                                                                                                                                                                                       
#SBATCH --mail-user=urwah.nawaz@adelaide.edu.au                                                                                                                                                                                                                       

module load SRA-Toolkit/2.8.2-1-centos_linux64

export WD="/fast/users/a1654797/gtex_data"

touch $WD/out/decrypt
touch $WD/out/fastq_dump
export DIR="/fast/users/a1654797/dbGaP/sra"

if [ ! -d "$DIR" ]; then
    echo "Wrong directory!"
    exit 1
fi

cd $DIR

echo $(date) >> $WD/out/decrypt.log

#check that all files are decrypted                                                                                                                                                                                                                                            
arr=(./*)

for f in "${arr[@]}"; do
    echo "$f"
    vdb-decrypt ./$f &>>$WD/out/decrypt.log
done

#get the fastq for all the sra files                                                                                                                                                                                                                                          

fastq-dump --gzip --split-files ./*.sra &>>$WD/out/fastq_dump.log
