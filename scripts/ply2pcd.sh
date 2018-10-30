#!/bin/sh

for file in `ls *.ply`
do
    echo ${file%.*}
    pcl_ply2pcd $file ${file%.*}.pcd
done
