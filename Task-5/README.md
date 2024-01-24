# Prerequisites

1. **Create Three DigitalOcean Droplets**
   - `droplet-1` acts as a the master node.
   - `droplet-2` acts as a worker node.
   - `droplet-3` acts as a load-balancer.

## On Master and Worker Nodes Do These:

2. **Unique Identifiers**
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

4. **Install Containerd**
   - use the following command:
     ```shell
     ./containerd_install.sh
     ```

5. **Install Kubernetes Tools**
   - Install `kubeadm`, `kubectl`, and `kubelet` on both the master and worker nodes.
     ```shell
     ./k8s_install.sh
     ```
## On load-balancer Do These:

1. **Installing HAProxy**

# Creating the Kubernetes Cluster

1. **Select Master Node**
    - On the master node, initialize the control node using the following commands:
      ```shell
      sudo su
      kubeadm init --apiserver-advertise-address=<ip-address> --pod-network-cidr=192.168.0.0/16
      export KUBECONFIG=/etc/kubernetes/admin.conf
      exit
      mkdir -p $HOME/.kube
      sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
      sudo chown $(id -u):$(id -g) $HOME/.kube/config
      ```

2. **Setup Pod Network**
    - Create the [Calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) pod network using the provided commands.
      ```
      curl https://raw.githubusercontent.com/projectcalico/calico/v3.27.0/manifests/calico.yaml -O
      kubectl apply -f calico.yaml
      ```

3. **Join Worker**
    - Join the worker node to the cluster with the given command.
      ```
      sudo su
      kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
      ```

# Start the Project

1. **Creating the WordPress Namespace**
    - Run the following command to create the "wordpress" namespace:
      ```shell
      kubectl create -f ./my-namespace.yaml
      ```

2. **Creating Services**
    - Create the necessary services, including a NodePort service for exposing WordPress to HAProxy and the outside world, and a ClusterIP service for connecting WordPress to MySQL:
      ```shell
      kubectl apply -f ./services.yaml
      ```

3. **Creating Storage Classes**
    - Create storage classes for WordPress, and MySQL
    - Apply these storage classes with the following command:
      ```shell
      kubectl apply -f ./storage-classes.yaml
      ```

4. **Creating Persistent Volumes**
    - Create persistent volumes for WordPress, MySQL, and the Docker registry as specified.
    - Apply these persistent volumes with the following command:
      ```shell
      kubectl apply -f ./pvs.yaml
      ```

5. **Creating Persistent Volume Claims**
    - Create persistent volume claims for WordPress, MySQL, and the Docker registry using the provided commands.
    - Apply these persistent volume claims with the following command:
      ```shell
      kubectl apply -f ./pvcs.yaml
      ```

6. **Creating Secret Files**
    - Create secret files for WordPress and MySQL password environment variables as instructed.
    - Apply these secrets with the following command:
      ```shell
      kubectl apply -f ./kustomization.yaml
      ```

7. Creating Deployments
- Deploy WordPress, and MySQL.
  ```
  kubectl apply -f ./mysql-deployment.yaml
  kubectl apply -f ./wordpress-deployment.yaml
  ```
