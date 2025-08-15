cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage4/oddnos.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"

./xfs-interface <<EOF 
fdisk
load --os ../stage4/oddnos.xsm 
exit
EOF