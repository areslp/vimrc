#!/bin/bash

# data_path=~/data/20180426/calibration.bag
# output_path=~/data/20180426/calibration/

# data_path=~/data/20180426/localization.bag
# output_path=~/data/20180426/localization

# data_path=~/data/20180426_2/calibration/2018-04-26-15-33-04.bag
# output_path=~/data/20180426_2/calibration/

# data_path=~/data/20180426_2/localization3/2018-04-26-15-51-22.bag
# output_path=~/data/20180426_2/localization3/

data_path=~/data/20180427/calibration/2018-04-27-11-05-30.bag
output_path=~/data/20180427/calibration/

topics=("/vlp_scan_1" "/vlp_scan_2" "/vlp_scan_3" "/vlp_scan_4" "/vlp_scan_5" "/vlp_scan_6" "/vlp_scan_7")

for topic in ${topics[@]}
do
    echo $topic
    mkdir -p ${output_path}/${topic}
    ./ros/bin/export_3d_data_main_cmw_ros --vlp_topic ${topic} --output_velodyne_pcd 1 -i ${data_path} -o ${output_path}
    mv ${output_path}/VLP_FRONT_LEFT ${output_path}/${topic}/
done
