#!/usr/bin/env python
import os 
import fnmatch  

a = open("gtex_runNames.txt", "w")

for path, subdirs, files in os.walk('.'): 
    for file in files:
        if fnmatch.fnmatch(file, '*.sra'):
            f=file 
            a.write(str(f) + os.linesep)
