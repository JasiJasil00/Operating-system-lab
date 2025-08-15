#!/bin/sh

# Go to home directory
cd ~


cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"
./xfs-interface <<EOF
fdisk
load --data ../stage2/sample.dat
df
copy 3 4 ../stage2/inodetable.txt
dump --inodeusertable
copy 69 69 ../stage2/data.txt
copy 5 5 ../stage2/root_file.txt
export sample.dat ../stage2/data1.txt
exit
EOF

