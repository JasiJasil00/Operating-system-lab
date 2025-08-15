#!/bin/sh
# Go to home directory
cd ~

# Correctly quote the path with spaces
cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface" 

./xfs-interface <<EOF
fdisk
load --data ../stage2/sample.dat
rm sample.dat
df
copy 3 4 ../stage2/assg/inodetable.txt
copy 5 5 ../stage2/assg/root_file.txt
exit
EOF
