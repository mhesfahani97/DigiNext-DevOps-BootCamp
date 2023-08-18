1. create three VMs
 - I use digital ocean for creating three VMs
 - go to kubernetes website to see what resourses you need for installing kubead ![digitalocean](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
 - after you created VMs go to digital ocean website and see how should initial server setup with ubuntu ![digitalocean](https://www.digitalocean.com/community/tutorials/initial-server-setup-with-ubuntu-20-04)
 - for contacting between VMs create VPC(Virtual Private Cloud) from digital ocean website
 - disable any swap space in VMs ![digitalocean](https://www.digitalocean.com/community/tutorials/how-to-add-swap-space-on-ubuntu-18-04)
2. install container run time on all of them
3. install kubeadm on all of them  [kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/install-kubeadm/)
4. intilize clusster on master node
5. create POD network
6. joining worker nodes to clusetr and defining master for them
7. 
