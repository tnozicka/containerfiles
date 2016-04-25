FROM fedora:23

RUN dnf install -y openssh-server java-1.8.0-openjdk-devel docker git && dnf upgrade -y && dnf clean all && \
/usr/bin/ssh-keygen -A && \
adduser jenkins && \
echo "root:jenkins" | chpasswd && \
echo "jenkins:jenkins" | chpasswd

RUN dnf install -y maven && dnf clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
