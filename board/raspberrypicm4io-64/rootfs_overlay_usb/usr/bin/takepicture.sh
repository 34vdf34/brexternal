#!/bin/sh
# gst-launch-1.0 --verbose v4l2src num-buffers=1 ! videoconvert ! pngenc ! filesink location=/tmp/image.png
gst-launch-1.0  v4l2src num-buffers=1 ! capsfilter caps="video/x-raw, width=800, height=448" ! videoconvert ! pngenc ! filesink location=/tmp/image.png
exit 0


