FROM php:alpine
MAINTAINER Dezhi Fang <dezhifang@gatech.edu>


RUN apk update && apk upgrade && \
    apk add --no-cache bash git openssh && \
    mkdir /opt && \
    cd /opt && \
    git clone https://github.com/phacility/libphutil.git && \
    git clone https://github.com/phacility/arcanist.git && \
    ln -s /opt/arcanist/bin/arc /usr/local/bin/arc
 
ENV LANG en_US.UTF-8
CMD ["/usr/local/bin/arc"]
