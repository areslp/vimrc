#!/bin/bash
set -e
base=`pwd`
echo $base

install_projects=(holo_base holo_3d holo_map)

for project in ${install_projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    cd build && cmake .. && make && make test && sudo make install
    cd $base
done

projects=(holo_calibration holo_data_provider holo_planning holo_sensors holo_cmw holo_vis holo_simulator holo_localization)

for project in ${projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    cd build && cmake .. && make && make test
    cd $base
done

no_test_projects=(holo_gateway holo_control)

for project in ${no_test_projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    cd build && cmake .. && make
    cd $base
done
