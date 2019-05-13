#!/bin/bash                                                                                                                                                                                                                                                                    

#SBATCH -A robinson                                                                                                                                                                                                                                                           
#SBATCH -p batch                                                                                                                                                                                                                                                              
#SBATCH -n 12                                                                                                                                                                                                                                                                 
#SBATCH -N 1                                                                                                                                                                                                                                                                  
#SBATCH --time=01-00:00                                                                                                                                                                                                                                                       
#SBATCH --mem=50GB                                                                                                                                                                                                                                                             

# notification configuration                                                                                                                                                                                                                                                   
#SBATCH --mail-type=END                                                                                                                                                                                                                                                       
#SBATCH --mail-type=FAIL                                                                                                                                                                                                                                                      
#SBATCH --mail-user=urwah.nawaz@adelaide.edu.au      

module load SRA-Toolkit/2.8.2-1-centos_linux64

bash validate.sh
