#!/bin/bash
# This script installs containerd and configures necessary settings.

# Load required kernel modules
cat <<EOF | sudo tee /etc/modules-load.d/k8s.conf
overlay
br_netfilter
EOF

modprobe overlay
modprobe br_netfilter

# Configure sysctl settings for networking
cat <<EOF | sudo tee /etc/sysctl.d/k8s.conf
net.bridge.bridge-nf-call-iptables  = 1
net.bridge.bridge-nf-call-ip6tables = 1
net.ipv4.ip_forward                 = 1
EOF

sysctl --system

# Check loaded kernel modules
lsmod | grep br_netfilter
lsmod | grep overlay

# Verify sysctl settings
sysctl net.bridge.bridge-nf-call-iptables net.bridge.bridge-nf-call-ip6tables net.ipv4.ip_forward

# Download and install containerd
wget https://github.com/containerd/containerd/releases/download/v1.7.12/containerd-1.7.12-linux-amd64.tar.gz
tar Cxzvf /usr/local containerd-1.7.12-linux-amd64.tar.gz

# Configure containerd systemd service
mkdir -p /usr/local/lib/systemd/system/
wget -P /usr/local/lib/systemd/system https://raw.githubusercontent.com/containerd/containerd/main/containerd.service
systemctl daemon-reload
systemctl enable --now containerd

# Download and install runc
wget https://github.com/opencontainers/runc/releases/download/v1.1.11/runc.amd64
install -m 755 runc.amd64 /usr/local/sbin/runc

# Download and install CNI plugins
mkdir -p /opt/cni/bin
wget https://github.com/containernetworking/plugins/releases/download/v1.4.0/cni-plugins-linux-amd64-v1.4.0.tgz
tar Cxzvf /opt/cni/bin cni-plugins-linux-amd64-v1.4.0.tgz

# Configure containerd with systemd cgroup support
mkdir /etc/containerd
containerd config default | sudo tee /etc/containerd/config.toml
sed -i 's/SystemdCgroup \= false/SystemdCgroup \= true/g' /etc/containerd/config.toml
curl -L https://raw.githubusercontent.com/containerd/containerd/main/containerd.service -o /etc/systemd/system/containerd.service

# Restart containerd service
systemctl daemon-reload
systemctl enable --now containerd
systemctl restart containerd.service
systemctl status containerd
