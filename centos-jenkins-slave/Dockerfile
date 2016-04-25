FROM centos:7

RUN yum install -y openssh-server java-1.7.0-openjdk java-1.8.0-openjdk docker git && yum clean all && \
/usr/bin/ssh-keygen -A && \
adduser jenkins && \
echo "root:jenkins" | chpasswd && \
echo "jenkins:jenkins" | chpasswd

RUN yum install -y maven && yum clean all

EXPOSE 22

CMD ["/usr/sbin/sshd", "-D"]
