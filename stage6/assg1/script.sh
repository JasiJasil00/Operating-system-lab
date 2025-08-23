cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage6/assg1/os_startup.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"


./xfs-interface <<EOF 
fdisk
load --os  ../stage6/assg1/os_startup.xsm
load --init ../stage6/assg1/square.xsm
load --int=10 ../stage6/haltprog.xsm
load --exhandler ../stage6/haltprog.xsm
exit
EOF

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xsm"

./xsm --debug --timer 0 <<EOF 
reg r1
c
reg r1
c
reg r1
c
reg r1
c
reg r1
c
EOF

