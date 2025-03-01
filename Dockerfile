FROM centos:7

RUN echo 'hosts: files mdns4_minimal [NOTFOUND=return] dns mdns4' > /etc/nsswitch.conf

RUN yum-config-manager --add-repo https://download.docker.com/linux/centos/docker-ce.repo
RUN ulimit -n 1024 && yum -q install -y docker-ce docker-ce-cli containerd.io

# -- Install OS packages:
RUN ulimit -n 1024 && yum -q update -y && yum -q install -y \
    bash \
    bzip2-devel \
    ca-certificates \
    curl \
    epel-release \
    gcc \
    gcc-c++ \
    git \
    gnutls \
    gnutls-devel \
    libffi-devel \
    make \
    ncurses-devel \
    openssh-clients \
    openssh-server \
    openssl \
    openssl-devel \
    rsync \
    readline-devel \
    tar \
    unzip \
    wget \
    zip \
    zlib-devel \
    temurin-11-jdk

RUN yum install java -y

RUN yum install httpd -y

RUN mkdir /var/www/html

COPY index.html /var/www/html/

RUN mkdir /jenkins

RUN useradd jenkins_test

RUN chmod jenkins_test:jenkins_test /jenkins

RUN echo "jenkins_test:P@ssword" | chpasswd

RUN echo "jenkins_test ALL=(ALL) NOPASSWD: ALL" >> /etc/sudoers.d/jenkins_test

EXPOSE 80