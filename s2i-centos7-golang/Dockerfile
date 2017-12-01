FROM centos:7

# consider all options and if it wouldn't be better to skip EXPOSE if someone wants to build non-server app
# you can always do it manually after
# one downside is that that using "s2i build" won't auto expose it with --run flag 
EXPOSE 5000

ENV HOME=/opt/app-root/src \
    PATH=/usr/local/go/bin:${PATH}

ENV GOPATH=${HOME}/go \
	STI_SCRIPTS_PATH=/usr/libexec/s2i
    
WORKDIR ${HOME}

RUN yum install -y epel-release && yum install -y nss_wrapper && yum remove -y epel-release && rpm -V nss_wrapper && \
    INSTALL_PKGS="git tar curl" && \
    yum install -y ${INSTALL_PKGS} && \
    rpm -V ${INSTALL_PKGS} && \
    yum clean all && \
	(set -o pipefail && curl --fail -L https://storage.googleapis.com/golang/$(curl 'https://golang.org/VERSION?m=text').linux-amd64.tar.gz | tar -xz -C /usr/local) && \
    find ${HOME} -exec chgrp 0 {} \; -exec chmod g+rw {} \; -type d -exec chmod g+x {} \;

LABEL io.openshift.s2i.scripts-url image://${STI_SCRIPTS_PATH}

ADD ./s2i/ ${STI_SCRIPTS_PATH}

USER 1001

CMD ${STI_SCRIPTS_PATH}/usage
