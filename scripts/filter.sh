#!/bin/sh
# rosbag filter $1 $2 'topic != "/holo/map/current_road_info" and topic != "/holo/localization/fusion/fused_odometry" and topic != "/holo/localization/lane/init_lane_odometry" and topic != "/holo/localization/lane/lane_odometry"'

rosbag filter $1 $2 'topic != "/holo/localization/lane/init_lane_odometry" and topic != "/holo/localization/lane/lane_odometry" and topic != "/holo/localization/lane/curbs" and topic != "/holo/localization/lane/motive_objects" and topic != "/holo/localization/lane/static_objects" and topic != "/holo/map/current_road_info"'
