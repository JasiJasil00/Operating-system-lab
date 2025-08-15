cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage4/assg/sumofsquares.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"

./xfs-interface <<EOF 
fdisk
load --os ../stage4/assg/sumofsquares.xsm 
exit
EOF