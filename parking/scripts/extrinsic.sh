#!/bin/sh

data_path=~/data/parking_data/

topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3" "vlp_scan_4" "vlp_scan_5" "vlp_scan_6" "vlp_scan_7")
names=("vlp_1_ext.yaml" "vlp_2_ext.yaml" "vlp_3_ext.yaml" "vlp_4_ext.yaml" "vlp_5_ext.yaml" "vlp_6_ext.yaml" "vlp_7_ext.yaml")

# for topic in ${topics[@]}
# do
    # echo $topic
    # cd ${data_path}/${topic}/VLP_FRONT_LEFT
    # sh ~/ply2pcd.sh 
# done

cp ${data_path}/vlp_scan_1/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_1_ext.yaml
cp ${data_path}/vlp_scan_2/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_2_ext.yaml
cp ${data_path}/vlp_scan_3/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_3_ext.yaml
cp ${data_path}/vlp_scan_4/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_4_ext.yaml
cp ${data_path}/vlp_scan_5/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_5_ext.yaml
cp ${data_path}/vlp_scan_6/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_6_ext.yaml
cp ${data_path}/vlp_scan_7/LOCALIZATION_MAP_VLP_extrinsic.yaml vlp_7_ext.yaml
