# create kubernetes cluster
1. create three VMs 
 - based on [Task_1](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/tree/main/Task_1) or Cloud provider
 - initial server setup on ubuntu ![digitalocean](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)

2. in every vm you can:
 - check product_uuid by `sudo dmidecode -s system-uuid` 
 - check mac address of each vm in the network by `ip link command`
 - check host name by `hostname` command
   **each one should be uniqe**

3. turn off the swap in every vm
 - vim /etc/fstab
 - comment the lines that contain swap word

4. install containerd on all of VMs
 - go to [containerd](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) or run containerd_install.sh as root

5. install kubeadm/ctl/let on all of them  
 - visit [kube...](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) or run k8s_install.sh as root

6. intilize clusster on master node
   kubeadm init --apiserver-advertise-address=<ip-address>
   mkdir -p $HOME/.kube(as normal user)
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config(as normal user)
   sudo chown $(id -u):$(id -g) $HOME/.kube/config(as normal user)
   export KUBECONFIG=/etc/kubernetes/admin.conf(this one should be as root)

7. join worker nodes to clusetr and defining master for them
   kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>
 
#create pod network
