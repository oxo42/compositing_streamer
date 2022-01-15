# compositing_streamer

Combines multiple RTSP streams into a single HLS stream.  

The problem I want to solve is I have multiple cameras that support RTSP.  I
want to combine them into a single HLS stream which I can throw onto a Google
Home Hub using Home Assistant

If you want to do this multiple times, run multiple containers

## TODO

* Make nginx start the streamer command only when there is a session going
* Figure out a way to have more than two streams along with clean ways of setting the x & y coords
* Figure out how to downsample the incoming streams into a single 1920x540 stream, right now it's a 3840x1080p stream
* Publish to dockerhub


## Dev tips

```shell
docker build -t compositing_streamer .
# Run docker in interactive
docker run -it --rm -p 8081:80 \
    -e PLAYLIST_ROOT=http://10.0.0.2:8081 \
    -e STREAM0=rtsp://10.42.0.3/live0 \
    -e STREAM1=rtsp://10.42.0.2/live0 \
    compositing_streamer
# Produdction run
docker run --rm -p 8081:80 \
    -e PLAYLIST_ROOT=http://10.0.0.2:8081 \
    -e STREAM0=rtsp://10.42.0.3/live0 \
    -e STREAM1=rtsp://10.42.0.2/live0 \
    compositing_streamer
```
