FROM alpine:3.15

# Install nginx and gstreamer
RUN apk add --update nginx gstreamer-tools gst-plugins-good gst-plugins-bad gst-plugins-ugly gst-libav
RUN rm -rf /var/cache/apk/* 
RUN mkdir /tmp/stream
COPY nginx.conf /etc/nginx/nginx.conf

COPY ./startup.sh /
RUN ["chmod", "+x", "/startup.sh"]

CMD ["/startup.sh"]
