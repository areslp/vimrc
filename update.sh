#!/bin/bash
set -e
base=`pwd`
echo $base

install_projects=(holo_base holo_3d holo_sensors holo_map holo_data_provider holo_localization holo_calibration)

for project in ${install_projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    # cd build && cmake .. && make && make test && sudo make install
    cd build && cmake .. && make && sudo make install
    cd $base
done

projects=(holo_planning holo_cmw holo_vis holo_simulator)

for project in ${projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    # cd build && cmake .. && make && make test
    cd build && cmake .. && make
    cd $base
done

no_test_projects=(holo_control holo_gateway)

for project in ${no_test_projects[@]}
do
    echo "=======================> $project <====================="
    set +e
    cd $project && git pull && mkdir build 
    set -e
    cd build && cmake .. && make
    cd $base
done
