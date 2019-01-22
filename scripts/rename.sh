#!/bin/bash

count=10000000
suffix=bmp
number=`ls *.${suffix} | wc -l`
echo $number
for img in `ls *.${suffix} | sort -n`; do
    echo $img
    mv ${img} ${count}.${suffix}
    let count=count+1
done

rename "s/^10/0/" *.${suffix}
