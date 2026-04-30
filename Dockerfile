# Dockerfile for building images to run kubemid in a container
# @author:  duoli
# @repo:     https://github.com/duoli-hub/kubemid

FROM kubemid/ansible:2.14.4-lite

# KUBEMID_VER will be set by build-args
ARG KUBEMID_VER=

ENV TZ="Asia/Shanghai"

RUN set -x \
    # Downloading kubemid
    && wget https://github.com/duoli-hub/kubemid/archive/refs/tags/"$KUBEMID_VER".tar.gz \
    && tar zxf ./"$KUBEMID_VER".tar.gz \
    && mv kubemid-"$KUBEMID_VER" /etc/kubemid \
    && ln -s -f /etc/kubemid/ezctl /usr/bin/ezctl \
    && ln -s -f /etc/kubemid/ezdown /usr/bin/ezdown \
    && ln -s -f /usr/local/bin/python3.11 /usr/bin/python \
    && ln -s -f /usr/local/bin/python3.11 /usr/bin/python3 \
    && mkdir -p /usr/libexec \
    && ln -s /usr/bin/python3 /usr/libexec/platform-python \
    # Cleaning
    && rm -rf ./"$KUBEMID_VER".tar.gz
