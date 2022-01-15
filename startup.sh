#!/bin/sh



gst-launch-1.0 -e \
    rtspsrc location=$STREAM0 ! rtph264depay ! h264parse ! decodebin ! videoconvert ! m.sink_0 \
    rtspsrc location=$STREAM1 ! rtph264depay ! h264parse ! decodebin ! videoconvert ! m.sink_1 \
    videomixer name=m sink_1::xpos=1920 ! x264enc ! mpegtsmux ! hlssink playlist-root=$PLAYLIST_ROOT location=/tmp/stream/stream.%05d.ts playlist-location=/tmp/stream/stream.m3u8 &

echo "Starting nginx"
nginx -g 'daemon off;'