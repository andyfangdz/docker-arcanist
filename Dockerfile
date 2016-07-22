FROM php:alpine
MAINTAINER Dezhi Fang <dezhifang@gatech.edu>

RUN mkdir /opt && \
    cd /opt && \
    git clone https://github.com/phacility/libphutil.git && \
    git clone https://github.com/phacility/arcanist.git && \
    wget https://raw.githubusercontent.com/git/git/master/contrib/completion/git-completion.bash && \
    cd /home/app && \
    ln -s /opt/arcanist/bin/arc /usr/local/bin/arc && \
    ln -s /opt/config/gitconfig /root/.gitconfig 
 
ENV LANG en_US.UTF-8
CMD ["/usr/local/bin/arc"]
