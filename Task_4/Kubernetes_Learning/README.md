# create kubernetes cluster
1. create three VMs 
 - based on [Task_1](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/tree/main/Task_1) or Cloud provider
 - initial server setup on ubuntu [digitalocean](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)

2. in every vm you can:
 - check product_uuid by `sudo dmidecode -s system-uuid` 
 - check mac address of each vm in the network by `ip link command`
 - check host name by `hostname` command
   **each one should be uniqe**

3. turn off the swap in every vm
 - vim /etc/fstab
 - comment the lines that contain swap word

4. sudo su

5. install containerd on all of VMs
 - go to [containerd](https://kubernetes.io/docs/setup/production-environment/container-runtimes/) or run containerd_install.sh 
 - change cgroup of containerd

6. install kubeadm/ctl/let on all of them  
 - visit [kube...](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/) or run k8s_install.sh

7. intilize clusster on master node
   kubeadm init --apiserver-advertise-address=<ip-address> --pod-network-cidr=192.168.0.0/16
   mkdir -p $HOME/.kube
   sudo cp -i /etc/kubernetes/admin.conf $HOME/.kube/config
   sudo chown $(id -u):$(id -g) $HOME/.kube/config
   export KUBECONFIG=/etc/kubernetes/admin.conf

8. join worker nodes to clusetr and defining master for them
   kubeadm join <control-plane-host>:<control-plane-port> --token <token> --discovery-token-ca-cert-hash sha256:<hash>

9. now see the nodes by:
 - kubectl get nodes -o wide

10. create [calico](https://docs.tigera.io/calico/latest/getting-started/kubernetes/self-managed-onprem/onpremises) self-managed on-permises pod network
 - curl https://raw.githubusercontent.com/projectcalico/calico/v3.26.1/manifests/calico.yaml -O
 - kubectl apply -f calico.yaml

11. now check the nodes
 - kubectl get nodes -o wide
 - the statuses of all nodes should be ready
 - if is not ready run these commands 
   - run kubectl get pods -n kube-system -l k8s-app=calco-node
    - -n kube-system means The kube-system namespace is a special namespace that contains pods that are used by the Kubernetes system. This includes pods for the Kubernetes API server, scheduler, controller manager, and other system components.
   - if shows Init:CrashLoopBackOff  
   - kubectl logs -n kube-system calico-node-b4wsk
   - kubectl logs -n kube-system calico-node-b4wsk -c upgrade-ipam
   - kubectl logs -n kube-system calico-node-b4wsk -c install-cni
   - the problem is here
now when i run netstat -an | grep 10.96.0.1:443



   - kubectl logs -n kube-system calico-node-b4wsk -c mount-bpffs
 


#create pod network
