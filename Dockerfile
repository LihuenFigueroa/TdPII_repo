FROM jenkins/jenkins:latest
LABEL maintainer="lihuenfigueroa@gmail.com"

USER root
RUN mkdir -p /var/log/jenkins; \
    mkdir -p /var/cache/jenkins; \
    chown -R jenkins:jenkins /var/log/jenkins; \
    chown -R jenkins:jenkins /var/cache/jenkins; \
    apt update; \
    apt install binutils gcc-avr gdb-avr avr-libc uisp avrdude flex byacc bison -y arduino-core make
    
USER jenkins

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"