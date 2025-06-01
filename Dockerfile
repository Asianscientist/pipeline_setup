FROM jenkins/ssh-agent:jdk17

USER root

# Install Docker CLI and curl
RUN apt-get update && \
    apt-get install -y docker.io curl python3 python3-pip && \
    apt-get clean

# Allow 'jenkins' user to run docker
RUN usermod -aG docker jenkins

# Set Docker config path for Jenkins user
ENV DOCKER_CONFIG /home/jenkins/.docker

# Create Docker CLI plugin directory for jenkins user
RUN mkdir -p /home/jenkins/.docker/cli-plugins && \
    curl -SL https://github.com/docker/compose/releases/download/v2.27.0/docker-compose-linux-x86_64 \
    -o /home/jenkins/.docker/cli-plugins/docker-compose && \
    chmod +x /home/jenkins/.docker/cli-plugins/docker-compose && \
    chown -R jenkins:jenkins /home/jenkins/.docker

#USER jenkins


# docker run -d --rm --name=agent1 --network your_jenkins_network \
#  -p 22:22 \
#  -e JENKINS_AGENT_SSH_PUBKEY="ssh-ed25519 AAAA..." \
#  custom-jenkins-agent

