# Task 5: Kubernetes-2 Adventures 🏰
Welcome to Task 5's kingdom of kubernetes-2 magic! will take us on an adventure through kubernetes.


## Task 🎯
1. **Optional-1 but Highly Recommended:**
 - It’s a good idea to setup a K8S cluster in a production manner. To do so, I recommend using kubeadm but you can do however you like according to K8S documentation:
 - [production-environment](https://kubernetes.io/docs/setup/production-environment/)
 - [production-environment-tools](hhttps://kubernetes.io/docs/setup/production-environment/tools/)
2. **Optional-2:**
 - Setup a reverse proxy and host everything that we will create from this point forward, behind it.
3. **Main:**
 - Setup a private registry with authentication for docker.
 - Create a namespace called “wordpress”.
 - Setup our own wordpress site on your K8S cluster and expose it to outside.
 - Restart & update wordpress to see what will happen.

# Lets do it 🛠️l
Now, grab your kubernetes-2 clusters and let's orchestrate our way to glory! 🌐🏹

## Prerequisite
1. **We Need Three Digitalocean Droplet**
   - droplet-1 is master
   - droplet-2 is worker
   - droplet-3 is for reverse proxy and docker registery
2. **On Each Droplet, Ensure Uniqueness for:**
   - Product UUID: Run `dmidecode -s system-uuid`.
   - MAC Address: Use `ip link` to retrieve the MAC address.
   - Hostname: Check the hostname with `hostname` command.
3. **Disable Swap On Master and Worker Droplets**:
   - do these:
   ```
   sudo su
   swapoff -a
   vim /etc/fstab
   ```
   Comment the lines containing the word "swap."
   `reboot`
   - [swap-off](https://tecadmin.net/disable-swapfile-on-ubuntu/)
4. **Containerd Installation**:
   - Install Containerd on master and worker.
   - Refer to the [official-documentation](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) or:
     ```
     sudo su
     containerd_install.sh
     ```
5. **Kubernetes Tools Installation**:
   - Install `kubeadm`, `kubectl`, and `kubelet` on master and worker.
   - Visit the [Kubernetes documentation](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) or:
     ```
     sudo su
     k8s_install.sh
     ```
6. **Install HAProxy**
   - on droplet-3
     ```
     sudo apt install --no-install-recommends software-properties-common
     sudo add-apt-repository ppa:vbernat/haproxy-2.8
     sudo apt install haproxy=2.8.\*
     haproxy -v
     ``` 

## Create kubernetes cluster 
   - read [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)

   - on master initialize the cluster  
     ```
     sudo su
     kubeadm init --apiserver-advertise-address=<ip-address> --pod-network-cidr=192.168.0.0/16
     export KUBECONFIG=/etc/kubernetes/admin.conf
     exit
     mkdir -p $HOME/.kube
     sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
     sudo chown $(id -u):$(id -g) $HOME/.kube/config
     ``` 
   - create [calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) pod network
     ```
     curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml -O
     kubectl apply -f calico.yaml    
     ```
   - join the worker
     ```
     sudo su
     kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
     ``` 
## Create wordpress namespace
   - run `kubectl create -f ./my-namespace.yaml

## Add resource configs for MySQL
   - if you need help see [kube-wordpress](https://kubernetes.io/docs/tutorials/stateful-application/mysql-wordpress-persistent-volume/)
   - run 

## Add resource configs for wordpress
