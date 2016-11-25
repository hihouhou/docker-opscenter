#
# Opscenter Dockerfile
#
# https://github.com/
#

# Pull base image.
FROM debian:latest

MAINTAINER hihouhou < hihouhou@hihouhou.com >

#Update & install packages for installting curl
RUN apt-get update && \
    apt-get install -y curl openjdk-7-jre

#add repository
RUN echo "deb http://debian.datastax.com/community stable main" | tee -a /etc/apt/sources.list.d/datastax.community.list && \
    curl -L https://debian.datastax.com/debian/repo_key | apt-key add -

#Update & install packages for installting opscenter
RUN apt-get update && \
    apt-get install -y opscenter


EXPOSE 8888

CMD ["/usr/share/opscenter/bin/opscenter", "-f"]
