#!/bin/sh
rosbag filter $1 $2 'topic != "/holo/localization/vision/vslam/global_feature_map" and topic != "/holo/localization/vision/vslam/local_feature_map" and topic != "/holo/localization/vision/vslam/odometry" and topic != "/vehicle_odometry_hpp"'
