
cd ~


cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"
./xfs-interface <<EOF
fdisk
load --os ../stage3/helloworld.xsm 
exit
EOF

# --os XFSdisk block-0