#
# Nasqueron - Arcanist image
#

FROM php:alpine
MAINTAINER Dezhi Fang <dezhifang@gatech.edu>

#
# Prepare the container
#

RUN apt-get update && apt-get install -y \
            openssh-client locales \
            --no-install-recommends && rm -r /var/lib/apt/lists/* && \
    sed -i -e 's/# en_US.UTF-8 UTF-8/en_US.UTF-8 UTF-8/' /etc/locale.gen && \
    echo 'LANG="en_US.UTF-8"' > /etc/default/locale && \
    dpkg-reconfigure --frontend=noninteractive locales && \
    update-locale LANG=en_US.UTF-8

RUN cd /opt && \
    git clone https://github.com/phacility/libphutil.git && \
    git clone https://github.com/phacility/arcanist.git && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
    cd /home/app && \
    ln -s /opt/arcanist/bin/arc /usr/local/bin/arc && \
    ln -s /opt/config/gitconfig /root/.gitconfig 
   
# && \
#     ln -s /opt/config/arcrc /root/.arcrc

COPY files /

#
# Docker properties
#

ENV LANG en_US.UTF-8
VOLUME ["/opt/config", "/opt/workspace"]
WORKDIR /opt/workspace
CMD ["/usr/local/bin/arc"]
