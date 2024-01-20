# Use a base image that supports systemd, for example, Ubuntu
FROM ubuntu:20.04

# Install necessary packages
RUN apt-get update && \
apt-get install -y shellinabox && \
apt-get install -y systemd && \
apt-get clean && \
rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*
RUN echo 'prjamming:0v3rth3t0p!' | chpasswd
# Expose the web-based terminal port
EXPOSE 4200
EXPOSE 443
EXPOSE 8080

# Start shellinabox
CMD ["/usr/bin/shellinaboxd", "-t", "-s", "/:LOGIN"]
