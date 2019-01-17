FROM jenkins/jenkins:lts

USER root

RUN apt-get update

RUN curl -sL https://deb.nodesource.com/setup_11.x | bash - && \
    apt-get install -y nodejs

RUN npm install jflint -g

USER jenkins