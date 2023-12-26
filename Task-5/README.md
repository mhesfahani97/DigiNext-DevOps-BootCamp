# Prerequisites

1. **Create Three DigitalOcean Droplets**
   - `droplet-1` serves as the master node.
   - `droplet-2` acts as a worker node.

2. **Unique Identifiers on Each Droplet:**
   - Verify the uniqueness of the following attributes on each droplet:
     - Product UUID: Execute `dmidecode -s system-uuid`.
     - MAC Address: Retrieve the MAC address using `ip link`.
     - Hostname: Confirm the hostname with the `hostname` command.

3. **Disable Swap**
   - Disable swap on both Droplets as follows:
     ```shell
     swapoff -a
     vim /etc/fstab
     ```
     Comment out the lines containing the word "swap," and then reboot the droplet.

4. **Containerd Installation:**
   - use the following command:
     ```shell
     ./containerd_install.sh
     ```

5. **Kubernetes Tools Installation:**
   - Install `kubeadm`, `kubectl`, and `kubelet` on both the master and worker nodes.
     ```shell
     ./k8s_install.sh
     ```

# Creating the Kubernetes Cluster
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
**WordPress deployment on Kubernetes is not complete! it needs docker registry.**

Feel free to customize this README further or add any additional details to suit your specific deployment requirements. Good luck! 🚀
