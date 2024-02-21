#!/bin/bash

# Update package lists
sudo apt install unzip -y
sudo apt update -y
sudo apt upgrade -y
# Install Git
sudo apt install -y git

# Install Java
sudo apt install -y default-jdk

# Install Maven
sudo apt install -y maven

# Install Docker
sudo apt install -y docker.io
sudo systemctl start docker
sudo systemctl enable docker

# Install Docker Compose
sudo apt install -y docker-compose

# Install kubectl
sudo apt-get update && sudo apt-get install -y apt-transport-https gnupg2
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubectl

# Install kubelet and kubeadm
sudo apt-get update && sudo apt-get install -y apt-transport-https curl
curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -
echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee -a /etc/apt/sources.list.d/kubernetes.list
sudo apt-get update
sudo apt-get install -y kubelet kubeadm

# Install AWS CLI
sudo apt install -y awscli

# Install Terraform
sudo apt-get update && sudo apt-get install -y gnupg software-properties-common curl
curl -fsSL https://apt.releases.hashicorp.com/gpg | sudo apt-key add -
sudo apt-add-repository "deb [arch=amd64] https://apt.releases.hashicorp.com $(lsb_release -cs) main"
sudo apt-get update && sudo apt-get install terraform

# Start Jenkins container(runnig docker socker as jenkins docker socker is not recommended)
docker run -d   --name jenkins   --user root   -p 8080:8080 -p 50000:50000   -v /var/jenkins_home:/var/jenkins_home   -v /var/run/docker.sock:/var/run/docker.sock   smitwaman/jenkins:smit

# Start SonarQube container
docker run -d --name sonarqube -p 9000:9000 sonarqube

# Start ArgoCD container


# Start Prometheus container
docker run -d --name prometheus -p 9090:9090 prom/prometheus

# Start Grafana container
docker run -d --name grafana -p 3000:3000 grafana/grafana

# Deploy k8s


echo "Installation completed. Git, Java, Maven, Docker, Docker Compose, kubectl, kubelet, kubeadm, AWS CLI, Terraform, Jenkins, SonarQube, ArgoCD, Prometheus, Grafana, and Kind cluster with two nodes are set up."
