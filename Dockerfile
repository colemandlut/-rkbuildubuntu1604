#
# Minimum Docker image to build Android AOSP
#
FROM ubuntu:16.04

MAINTAINER Qi Zhengjun <coleman_dlut@hotmail.com>

# Keep the dependency list as short as reasonable
RUN apt-get update && \
    apt-get upgrade && \
    apt-get install -y bison gperf libsdl-dev libesd0-dev build-essential \
        zip curl libncurses5-dev zlib1g-dev libxml2-utils genromfs lsb-core \
        libc6-dev-i386 gcc-multilib g++-multilib lib32z1-dev lib32ncurses5-dev \
        u-boot-tools android-tools-fastboot gcc-multilib libswitch-perl \
        x11proto-core-dev libx11-dev lib32z-dev ccache libgl1-mesa-dev \
        libxml2-utils xsltproc unzip texinfo && \
    apt-get install -y gcc-arm-linux-gnueabihf && \
    apt-get install -y libwxgtk3.0-dev lib32readline6-dev && \
    apt-get install -y software-properties-common && \
    apt-get install -y liblz4-tool && \
    add-apt-repository ppa:openjdk-r/ppa && \
    apt-get update -y && \
    apt-get install -y openjdk-8-jdk && \
    apt-get clean && rm -rf /var/lib/apt/lists/* /tmp/* /var/tmp/*


# COPY utils/docker_entrypoint.sh /root/docker_entrypoint.sh
# ENTRYPOINT ["/root/docker_entrypoint.sh"]
CMD ["/bin/bash"]
