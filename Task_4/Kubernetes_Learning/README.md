# Kubernetes Cluster Setup Guide

This guide outlines the steps to create a Kubernetes cluster on three Virtual Machines (VMs). You can either use your own VMs based on [Task_1](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/tree/main/Task_1) or a Cloud provider such as DigitalOcean. We'll be using Ubuntu for the initial setup.

## Prerequisites

1. **VM Creation**:
   - Set up three VMs based on your preferred method.
   - If using DigitalOcean, refer to this [initial server setup guide](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04).

2. **Master Node Setup**:
   - SSH into your master node.
   - Switch to the root user with `sudo su`.

3. **VM Configuration**:
   - On each VM, ensure uniqueness for:
     - Product UUID: Run `dmidecode -s system-uuid`.
     - MAC Address: Use `ip link` to retrieve the MAC address.
     - Hostname: Check the hostname with `hostname` command.

4. **Swap Configuration**:
   - Disable swap on all VMs:
     ```
     swapoff -a
     vim /etc/fstab
     ```
     Comment out lines containing the word "swap."

5. **Containerd Installation**:
   - Install Containerd on all VMs.
   - Refer to the [official documentation](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) or run `containerd_install.sh`.
   - Adjust the cgroup settings for Containerd.

6. **Kubernetes Tools Installation**:
   - Install `kubeadm`, `kubectl`, and `kubelet` on all VMs.
   - Visit the [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) or use `k8s_install.sh`.

## Initialize Kubernetes Cluster (Master Node)

1. On the master node, initialize the cluster:
   ```
   kubeadm init --apiserver-advertise-address=<ip-address> --pod-network-cidr=192.168.0.0/16
   ```
2. Exit the root user, and perform the following steps as your regular user:
   ```
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   ```
3. Return to root with `sudo su`.
4. Set the `KUBECONFIG` environment variable:
   ```
   export KUBECONFIG=/etc/kubernetes/admin.conf
   ```

## Join Worker Nodes to the Cluster

1. Repeat steps 2 to 6 of the "Create Cluster" section on your two worker nodes.

2. Join worker nodes to the cluster, specifying the master node:
   ```
   sudo su
   kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
   ```

3. Return to the master node and check the nodes:
   ```
   kubectl get nodes -o wide
   ```

## Deploy Nginx Webserver

1. Deploy an Nginx web server using the provided `deployment-definition.yml`:
   ```
   kubectl apply -f deployment-definition.yml
   ```

Congratulations! You now have a Kubernetes cluster up and running. Don't forget to explore further Kubernetes resources to manage your applications efficiently.
```

Feel free to replace `<ip-address>`, `<token>`, `<hash>`, and other placeholders with your actual values as needed.
