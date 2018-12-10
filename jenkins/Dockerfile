FROM jenkins/jenkins:2.155-alpine
USER root

COPY plugins.txt /plugins.txt
COPY style.css /style.css

RUN mkdir -p /usr/share/jenkins/ref/secrets && \
    echo false > /usr/share/jenkins/ref/secrets/slave-to-master-security-kill-switch && \
    /usr/local/bin/install-plugins.sh < /plugins.txt

USER jenkins
