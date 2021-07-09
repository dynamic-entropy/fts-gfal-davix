FROM gitlab-registry.cern.ch/linuxsupport/cc7-base:latest

RUN yum -y group install "Development Tools"
RUN yum -y install man-pages
RUN yum -y install git-all
RUN yum -y install cmake doxygen glib2-devel libattr-devel openldap-devel zlib-devel json-c-devel
RUN yum -y install lfc-devel dpm-devel srm-ifce-devel dcap-devel globus-gass-copy-devel xrootd-client-devel libssh2-devel gtest-devel 
RUN yum -y install e2fsprogs-devel libuuid-devel pugixml-devel
RUN yum -y install boost-devel python-devel python-pip
RUN yum -y install libxml2-devel openssl-devel
RUN yum -y install cmake3

WORKDIR /home/dev

RUN echo "INDIA"

RUN git clone --recursive https://github.com/dynamic-entropy/fts-gfal-davix.git

WORKDIR /home/dev/fts-gfal-davix

#Present installation for davix - package manager
# RUN yum -y install davix-devel

#Desired installation for davix - building from source
RUN cd davix && \
    git submodule update --recursive --init 

# RUN mkdir davix/build && cd davix/build && \
#     cmake3 -DCMAKE_INSTALL_PREFIX=/ && \
#     make && \
#     make install

# #build and install gfal2
# RUN mkdir gfal2/build && cd gfal2/build && \
#     cmake -DCMAKE_BUILD_TYPE=Debug -DCMAKE_INSTALL_PREFIX=/usr -DSYSCONF_INSTALL_DIR=/etc .. && \
#     make && \
#     make install

# #install gfal-python
# RUN cd gfal2-python && \
#     python setup.py install

# #install gfal-util
# RUN cd gfal2-util && \
#     python setup.py install

CMD ["/bin/bash"]
