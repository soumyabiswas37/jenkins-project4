FROM centos:7

RUN yum update -y

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