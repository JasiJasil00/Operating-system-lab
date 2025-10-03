cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage7/os_startup.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"


./xfs-interface <<EOF 
fdisk
load --os  ../stage7/os_startup.xsm
load --init ../stage7/square.xsm
load --int=10 ../stage7/haltprog.xsm
load --exhandler ../stage7/haltprog.xsm
load --library ../expl/library.lib
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
reg r1
c
EOF


