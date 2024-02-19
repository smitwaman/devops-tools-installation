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

# Start Jenkins container
docker run -d --name jenkins -p 8080:8080 -p 50000:50000 jenkins/jenkins

# Start SonarQube container
docker run -d --name sonarqube -p 9000:9000 sonarqube

# Start ArgoCD container
kubectl create namespace argocd
kubectl apply -n argocd -f https://raw.githubusercontent.com/argoproj/argo-cd/stable/manifests/install.yaml

# Start Prometheus container
docker run -d --name prometheus -p 9090:9090 prom/prometheus

# Start Grafana container
docker run -d --name grafana -p 3000:3000 grafana/grafana

# Deploy Kind cluster with two nodes
curl -Lo ./kind https://kind.sigs.k8s.io/dl/v0.12.0/kind-linux-amd64
chmod +x ./kind
sudo mv ./kind /usr/local/bin/kind
kind create cluster --config - <<EOF
kind: Cluster
apiVersion: kind.x-k8s.io/v1alpha4
nodes:
- role: control-plane
- role: worker
- role: worker
EOF

echo "Installation completed. Git, Java, Maven, Docker, Docker Compose, kubectl, kubelet, kubeadm, AWS CLI, Terraform, Jenkins, SonarQube, ArgoCD, Prometheus, Grafana, and Kind cluster with two nodes are set up."
