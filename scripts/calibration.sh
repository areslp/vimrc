cd ~/data/zhongding/paklot/build/
reset && make calibration

data_path=~/data/201805312130/

# topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3" "vlp_scan_4")
# topics=("vlp_scan_1" "vlp_scan_2" "vlp_scan_3")
# topics=("vlp_scan_1" "vlp_scan_2")
topics=("vlp_scan_1")

            # --scene_file /home/$user/data/zhongding/0515_riegl_map/riegl_0.1.pcd \
            # --scene_file ~/000/riegl_0.1.pcd \

for topic in ${topics[@]}
do
    echo $topic
    ./app/calibration \
            --scene_file ~/000/riegl_clean.pcd \
            --object_file ${data_path}/${topic}/VLP_FRONT_LEFT/00000000.pcd \
            --overlap 0.2 \
            --sample_size 500 \
            --max_time_seconds 120 \
            --delta 1.0 \
            --max_corresponding_dis 1.0
    mv *.yaml screen* ${data_path}/${topic}
done


