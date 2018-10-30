#!/bin/bash

# data_path=~/data/20180426/calibration/
# data_path=~/data/20180426/localization/
# data_path=~/data/20180426_2/calibration/
# data_path=~/data/20180426_2/localization3/
data_path=~/data/201805312130/

topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3" "vlp_scan_4")
# topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3")
# topics=("vlp_scan_1" "vlp_scan_2")

for topic in ${topics[@]}
do
    echo $topic
    cd ${data_path}/${topic}/VLP_FRONT_LEFT
    sh ~/scripts/ply2pcd.sh 
done
