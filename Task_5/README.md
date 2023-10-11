# Kubernetes-2 WordPress Deployment 🏰
Welcome to the Kubernetes-2 WordPress deployment guide, where we will embark on an exciting journey through the magical realm of Kubernetes. This document will guide you through the process of setting up WordPress on a Kubernetes cluster.

## Task Objective 🎯
### Optional but Highly Recommended:
1. For a production-grade Kubernetes cluster setup, it is advisable to use `kubeadm`. However, you can choose any method that suits your needs while following Kubernetes documentation:
   - [Production Environment Setup](https://kubernetes.io/docs/setup/production-environment/)
   - [Production Environment Tools](https://kubernetes.io/docs/setup/production-environment/tools/)
2. Optionally, set up a reverse proxy to host all the services we'll create behind it.

### Main Tasks:
3. Establish a private Docker registry with authentication.
4. Create a Kubernetes namespace named "wordpress."
5. Deploy a WordPress site on your Kubernetes cluster and expose it to the outside world.
6. Perform restarts and updates on WordPress to observe their effects.

# Let's Get Started 🛠️
Now, let's dive into the world of Kubernetes-2 clusters and orchestrate our path to success! 🌐🏹

## Prerequisites
Before you begin, make sure you have the following components and configurations in place:

1. **Three DigitalOcean Droplets**
   - `droplet-1` serves as the master node.
   - `droplet-2` acts as a worker node.
   - `droplet-3` is designated for the reverse proxy and Docker registry.

2. **Unique Identifiers on Each Droplet:**
   - Verify the uniqueness of the following attributes on each droplet:
     - Product UUID: Execute `dmidecode -s system-uuid`.
     - MAC Address: Retrieve the MAC address using `ip link`.
     - Hostname: Confirm the hostname with the `hostname` command.

3. **Disable Swap on Master and Worker Droplets:**
   - Disable swap as follows:
     ```shell
     sudo su
     swapoff -a
     vim /etc/fstab
     ```
     Comment out the lines containing the word "swap," and then reboot the droplet.
     - [Disable Swap on Ubuntu](https://tecadmin.net/disable-swapfile-on-ubuntu/)

4. **Containerd Installation:**
   - Install Containerd on both the master and worker nodes. You can refer to the [official documentation](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) or use the following command:
     ```shell
     sudo su
     containerd_install.sh
     ```

5. **Kubernetes Tools Installation:**
   - Install `kubeadm`, `kubectl`, and `kubelet` on both the master and worker nodes. For installation instructions, visit the [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) or use the following command:
     ```shell
     sudo su
     k8s_install.sh
     ```

6. **Install HAProxy:**
   - On `droplet-3`, install HAProxy using the following commands:
     ```shell
     sudo apt install --no-install-recommends software-properties-common
     sudo add-apt-repository ppa:vbernat/haproxy-2.8
     sudo apt install haproxy=2.8.*
     haproxy -v
     ```

## Config the HAProxy
 - On `droplet-3`, config the HAProxy.
   ```
   cp ./haproxy.cfg /etc/haproxy
   sudo systemctl restart haproxy.service
   sudo systemctl enable haproxy.service
   ```

## Creating the Kubernetes Cluster
- For information on creating a Kubernetes cluster, refer to the [kubeadm documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/).
- On the master node, initialize the cluster using the following commands:
  ```shell
  sudo su
  kubeadm init --apiserver-advertise-address=<ip-address> --pod-network-cidr=192.168.0.0/16
  export KUBECONFIG=/etc/kubernetes/admin.conf
  exit
  mkdir -p $HOME/.kube
  sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
  sudo chown $(id -u):$(id -g) $HOME/.kube/config
  ```
- Create the [Calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) pod network using the provided commands.
  ```
  curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml -O
  kubectl apply -f calico.yaml
  ```
- Join the worker node to the cluster with the given command.
  ```
  sudo su
  kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
  ```

## Creating the WordPress Namespace
- Run the following command to create the "wordpress" namespace:
  ```shell
  kubectl create -f ./my-namespace.yaml
  ```

## Creating Services
- Create the necessary services, including a NodePort service for exposing WordPress to HAProxy and the outside world, and a ClusterIP service for connecting WordPress to MySQL:
  ```shell
  kubectl apply -f ./services.yaml
  ```

## Creating Storage Classes
- Create storage classes for WordPress, MySQL, and the Docker registry using the provided commands.
- Apply these storage classes with the following command:
  ```shell
  kubectl apply -f ./storage-classes.yaml
  ```

## Creating Persistent Volumes
- Create persistent volumes for WordPress, MySQL, and the Docker registry as specified.
- Apply these persistent volumes with the following command:
  ```shell
  kubectl apply -f ./pvs.yaml
  ```

## Creating Persistent Volume Claims
- Create persistent volume claims for WordPress, MySQL, and the Docker registry using the provided commands.
- Apply these persistent volume claims with the following command:
  ```shell
  kubectl apply -f ./pvcs.yaml
  ```

## Creating Secret Files
- Create secret files for WordPress and MySQL password environment variables as instructed.
- Apply these secrets with the following command:
  ```shell
  kubectl apply -f ./kustomization.yaml
  ```

## Creating a Config Map
- Create a config map for the Docker registry using the provided command.
- Apply this config map with the following command:
  ```shell
  kubectl apply -f ./config-map.yaml
  ```

## Creating Deployments
- Deploy WordPress, MySQL, and the Docker registry with the provided commands.
  ```
  kubectl apply -f ./dregistry-deployment.yaml
  kubectl apply -f ./mysql-deployment.yaml
  kubectl apply -f ./wordpress-deployment.yaml
  ```
Your WordPress deployment on Kubernetes is now complete! Enjoy your journey through the magical kingdom of Kubernetes-2.

Feel free to customize this README further or add any additional details to suit your specific deployment requirements. Good luck! 🚀
