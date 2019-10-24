FROM jenkinsci/blueocean
LABEL maintainer="lihuenfigueroa@gmail.com"

USER root
RUN mkdir -p /var/log/jenkins
RUN mkdir -p /var/cache/jenkins
RUN chown -R jenkins:jenkins /var/log/jenkins
RUN chown -R jenkins:jenkins /var/cache/jenkins
USER jenkins

ENV JAVA_OPTS="-Xmx8192m"
ENV JENKINS_OPTS="--handlerCountMax=300 --logfile=/var/log/jenkins/jenkins.log --webroot=/var/cache/jenkins/war"