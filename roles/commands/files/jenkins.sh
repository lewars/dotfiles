#!/bin/bash -x

if [[ $1 == 'docker' ]]; then
    docker run --name jenkins-local \
           -p 8080:8080 \
           -p 50000:50000 \
           -v "${HOME}/.jenkins":/var/jenkins_home \
           -d jenkins/jenkins:lts
else
    /usr/local/opt/openjdk@11/bin/java \
        -Dmail.smtp.starttls.enable=true \
        -jar /usr/local/opt/jenkins-lts/libexec/jenkins.war \
        --httpListenAddress=127.0.0.1 \
        --httpPort=8080
fi

