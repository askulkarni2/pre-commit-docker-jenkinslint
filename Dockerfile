FROM jenkins/jenkins:lts

USER root

RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs

RUN npm install jflint -g

RUN /usr/local/bin/install-plugins.sh \
    pipeline-model-definition \
    performance \
    gatling \
    kubernetes \
    cloudbees-folder \
    blueocean \
    ansicolor
ADD run-jflint.sh /usr/local/bin/run-jflint.sh