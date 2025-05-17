FROM jenkins/jenkins:lts

USER root

# Install docker CLI
RUN apt-get update && \
    apt-get install -y docker.io && \
    usermod -aG docker jenkins && \
    apt-get install -y python3-pip

USER jenkins

