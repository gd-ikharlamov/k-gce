FROM docker.io/fedora:latest
RUN dnf -y install yum && \
    dnf clean all && \
    systemctl disable dnf-makecache.timer
ENV container docker
STOPSIGNAL SIGRTMIN+3
CMD ["/sbin/init"]
