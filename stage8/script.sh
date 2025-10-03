cd ~

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/spl"

./spl "../stage8/os_startup.spl"
./spl "../stage8/sample_timer.spl"

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xfs-interface"


./xfs-interface <<EOF 
fdisk
load --os  ../stage8/os_startup.xsm
load --init ../stage8/square.xsm
load --int=10 ../stage8/haltprog.xsm
load --exhandler ../stage8/haltprog.xsm
load --library ../expl/library.lib
load --int=timer ../stage8/sample_timer.xsm
exit
EOF

cd  "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/xsm"

./xsm --timer 7

cd "/mnt/d/nitc curriculum/sem5/OPERATING SYSTEM LAB/myexpos/stage8"

rm -f os_startup.xsm sample_timer.xsm

