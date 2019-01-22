#!/bin/bash

# check input parameters
if [ "$#" -ne 2 ]; then
    echo "illegal number of parameters !"
    echo "sh update.sh [branch:parking_dev_v2] [server type:0(block),1(root)]"
    exit -1
fi

branch=$1
type=$2
echo "branch : " $branch
echo "type : " $type

set -e
base=`pwd`
echo $base

block_projects=(holo_base holo_3d holo_sensors holo_data_provider holo_map holo_calibration holo_localization holo_perception holo_vis holo_simulator)
root_projects=(holo_base holo_3d holo_sensors holo_data_provider holo_map holo_parking holo_control holo_gateway holo_perception holo_planning_server holo_vis holo_simulator)

# set target projects
if [ $type -eq 0 ]; then
    projects=${block_projects[@]}
else
    projects=${root_projects[@]}
fi

echo "projects : " $projects

# update target projects
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
    make -j4
    sudo make install
    cd $base
done

# cmw
cmw=(holo_cmw)
echo "=======================> cmw <======================="
set -e
cd $cmw
git checkout $branch
git pull
set +e
mkdir build
set -e
cd build
cmake ..
make -j4
cd $base

echo "Done"

