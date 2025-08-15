cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage5/oneto10.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"

./xfs-interface <<EOF 
fdisk
load --os ../stage5/oneto10.xsm 
exit
EOF

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xsm"

./xsm --debug <<EOF
reg
mem 1
s
c
c
c
c
c
EOF

