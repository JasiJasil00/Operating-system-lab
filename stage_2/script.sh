#!/bin/sh

# Go to home directory
cd ~

# Correctly quote the path with spaces
cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface" 
./xfs-interface <<EOF
fdisk
load --data ../stage_1/sample.dat
df
copy 3 4 ../stage_1/inodetable.txt
dump --inodeusertable
copy 69 69 ../stage_1/data.txt
copy 5 5 ../stage_1/root_file.txt
export sample.dat ../stage_1/data1.txt
exit
EOF

