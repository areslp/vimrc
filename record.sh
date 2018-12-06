#!/bin/sh

# check input parameters
if [ "$#" -ne 1 ]; then
	echo "illegal number of parameters !"
	echo "sh record.sh [bag filename prefix]"
	exit -1
fi

# record
bag_filename_prefix=$1
rosbag record -a -x "(.*)input_car(.*)|(.*)foreground(.*)|(.*)parkinglot/car" -o ${bag_filename_prefix}
