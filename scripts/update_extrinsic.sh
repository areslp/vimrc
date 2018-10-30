#!/bin/bash

data_path=~/data/201805312130

topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3" "vlp_scan_4")
# topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3")
# topics=("vlp_scan_1" "vlp_scan_2")
i=0

for topic in ${topics[@]}
do
    echo $topic
    i=`expr $i + 1`
    echo $i
    cp ${data_path}/${topic}/LOCALIZATION_MAP_VLP_extrinsic.yaml ~/work/holo_perception/param/parkinglot/extrinsic_$i.yaml
    cp ${data_path}/${topic}/LOCALIZATION_MAP_VLP_extrinsic.yaml ~/work/holo_sensors/param/${topic}_extrinsic.yaml
done

# update root server
scp -r /home/holo-blockserver/work/holo_perception/param/parkinglot/ rootserver@192.168.2.10:/home/rootserver/work/holo_perception/param/
scp -r /home/holo-blockserver/work/holo_sensors/param/*_extrinsic.yaml rootserver@192.168.2.10:/home/rootserver/work/holo_sensors/param/
