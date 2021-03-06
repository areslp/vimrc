#!/bin/bash

# check input parameters
if [ "$#" -ne 2 ]; then
    echo "illegal number of parameters !"
    echo "sh update.sh [branch:parking_dev_v2] [server type:0(block),1(root),2(pilot)]"
    exit -1
fi

branch=$1
type=$2
echo "branch : " $branch
echo "type : " $type

set -e
base=`pwd`
echo $base

base_projects=(holo_base holo_3d holo_sensors holo_cmw)
block_projects=(holo_base holo_3d holo_sensors holo_data_provider holo_map holo_calibration holo_localization holo_perception)
root_projects=(holo_base holo_3d holo_sensors holo_map holo_parking holo_perception holo_planning_server)
pilot_projects=(holo_base holo_3d holo_sensors holo_data_provider holo_localization holo_map holo_gateway holo_planning holo_control holo_perception)
simulator_projects=(holo_vis holo_simulator)

# set target projects
if [ $type -eq 0 ]; then
    projects=${block_projects[@]}
elif [ $type -eq 1 ]; then
    projects=${root_projects[@]}
elif [ $type -eq 2 ]; then
    projects=${pilot_projects[@]}
fi

# update base projects
echo "base projects : " $base_projects
for project in ${base_projects[@]}
do
    echo "=======================> $project <====================="
    set -e
    cd $project
    git fetch
    git checkout $branch
    git reset --hard origin/$branch
    git pull
    set +e
    mkdir build
    set -e
    cd build
    cmake ..
    make -j4
    if [ "$project" = "holo_cmw" ]; then
        sudo -E PYTHONPATH=$PYTHONPATH make install
    else
        sudo make install
    fi
    cd $base
done

# update target projects
echo "target projects : " $projects

for project in ${projects[@]}
do
    echo "=======================> $project <====================="
    set -e
    cd $project
    git fetch
    git checkout $branch
    git reset --hard origin/$branch
    git pull
    set +e
    mkdir build
    set -e
    cd build
    cmake ..
    make -j`nproc`
    sudo make install
    cd $base
done

# update simulator projects, no install
for project in ${simulator_projects[@]}
do
    echo "=======================> $project <====================="
    set -e
    cd $project
    git fetch
    git checkout $branch
    git reset --hard origin/$branch
    git pull
    set +e
    mkdir build
    set -e
    cd build
    cmake ..
    make -j`nproc`
    cd $base
done
echo "Done"
