#!/bin/sh
avconv -r 30 -start_number 0 -i %07d.bmp -vf "scale=trunc(iw/2)*2:trunc(ih/2)*2" output.mp4
