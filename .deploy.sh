#!/bin/bash

# Install Docker
sudo apt-get update
sudo apt-get install -y docker.io

# Install Minikube
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start Minikube
minikube start

# Enable Ingress (Optional)
minikube addons enable ingress

# Run Jenkins container
docker run -d -p 8080:8080 -p 50000:50000 jenkins/jenkins:lts

# Run SonarQube container
docker run -d -p 9000:9000 sonarqube

# Run Argo CD
kubectl create namespace argocd
helm install argocd argo/argo-cd -n argocd

# Run Prometheus container
docker run -d -p 9090:9090 prom/prometheus

# Run Grafana container
docker run -d -p 3000:3000 grafana/grafana
