#!/bin/sh
# Go to home directory
cd ~

# Correctly quote the path with spaces
cd "/mnt/d/nitc curriculum/sem4/OPERATING SYSTEM LAB/MYEXPOS/xfs-interface" 

./xfs-interface <<EOF
fdisk
load --data ../stage2/sample.dat
rm sample.dat
df
copy 3 4 ../stage2/assg/inodetable.txt
copy 5 5 ../stage2/assg/root_file.txt
exit
EOF
