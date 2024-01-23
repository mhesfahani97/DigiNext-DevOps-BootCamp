#!/bin/bash
# This script installs Kubernetes tools (kubelet, kubeadm, kubectl) on a Debian-based system.

# Update package list
apt-get update

# Install required dependencies
apt-get install -y apt-transport-https ca-certificates curl

# Download Kubernetes GPG key and store it in /etc/apt/keyrings/kubernetes-apt-keyring.gpg
curl -fsSL https://pkgs.k8s.io/core:/stable:/v1.29/deb/Release.key | sudo gpg --dearmor -o /etc/apt/keyrings/kubernetes-apt-keyring.gpg

# Add Kubernetes repository to the sources list
echo 'deb [signed-by=/etc/apt/keyrings/kubernetes-apt-keyring.gpg] https://pkgs.k8s.io/core:/stable:/v1.29/deb/ /' | sudo tee /etc/apt/sources.list.d/kubernetes.list

# Update package list again to include the Kubernetes repository
apt-get update

# Install Kubernetes components: kubelet, kubeadm, and kubectl
apt-get install -y kubelet kubeadm kubectl

# Mark Kubernetes packages as held to prevent automatic updates
apt-mark hold kubelet kubeadm kubectl

