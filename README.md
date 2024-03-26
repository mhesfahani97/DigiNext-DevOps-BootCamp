# Tasks Designer
- [RoohAllah-Godazgar](https://www.linkedin.com/in/roohallah-godazgar/)

## Task-1: VM and Network
1. Use any kind of virtualization that you desire.  
  - Create a “host-only” network.
  - Create any kind of network which has Internet access through an interface of your host.
  - To test the access to another network:
    - Create a VM with 2 interfaces; one to access internet and another as host-only = Machine A.
    - Create another VM with host-only network = Machine B.
    - Grant internet access from A to B.
2. Create a VPN server or Proxy server:
  - This VPN or proxy server MUST be usable through cli for package managers like apt or yum.
### Helpful Resources
- [how-create-proxy-server](https://www.linuxandubuntu.com/home/create-proxy-server#step-4-test-the-proxy-server)  
- [setup-proxy-on-ubuntu](https://operavps.com/docs/setup-proxy-on-ubuntu/)  
- [linux-learning](https://www.youtube.com/playlist?list=PLRMCwJJwWR1A3_ECuOqdIaR-XLnr6bDj_)  

## Task-2: Lunch a Blog Via Wordpress Using docker-compose
1. Lunch a blog via wordpress using docker-compose.  
2. Persist your data, so you don't lose them in case of container restart.
### Helpful Resources
- [docker-learning](https://dockerme.ir/)  

## Task-3: Reverse Proxy + SQL + NoSQL
1. Reverse Proxy
  - Create 3 VM & install Nginx on them
  - Configure all Nginx instances as equal and serve a static page on each of them
  - Specify an instance specific content on each node which enables you to see which one you’re accessing
  - Create a forth VM and install HAproxy on it
  - Configure the HAproxy to answer on a specific URL and balance the load on that Nginx instances
  - Reconfigure the HAproxy to answer on the same URL but on 3 different path which each of them will connect to each Nginx instances
  - Reconfigure the HAproxy to answer on the different URL which each of them will connect to each Nginx instances
2. SQL
  - Setup a single MySQL/MariaDB node without any configurations (default configuration). Secure it so you could only be able to connect to it by authentication (root user MUST only be able to connect to it from localhost). Create some databases and within these databases, create some tables and then insert some data in these tables (Play with it).
  - Now lets create a slave node. you need to set some configuration for your master (read where you can put your configurations and what is the best way to do so to make it easy to eyes for read).
  - In which way you desire, corrupt your master node and then change your slave to be act as new master node and then recover your old master node and set it up to be your new slave (switch master & slave roles between your 2 nodes).
  - Now let's use what we did in last task and create a slave for our wordpress service and do as described in section 3 of this task, on this service.
  - NOTE: It's not important that you want to setup some VMs and install required services OR use docker for this task. I recommend to do both of them or event combine it (master on docker and slave on VM and vice versa)
3. NoSQL
  - To understand the whole picture, please read with details about raft protocol and also it's important to know which filesystem is suitable for which scenario. About the task itself:
  - Perform required kernel tuning for MongoDB and install a single instance and work a little with it.
  - Setup a replica set cluster with appropriate number of nodes.
  - Like we did with MySQL, create DB, insert, update, ... datat to them. It's better to create a simple python app for this to see how applications communicate with MongoDB.
  - Finally, configure your current replicaset to enable authentication to communicate with MongoDB.

### Helpful Resources
- [morteza-bashsiz](https://www.youtube.com/playlist?list=PLRMCwJJwWR1A3_ECuOqdIaR-XLnr6bDj_)

## Task-4:

## Task-5: Deploy WordPress on Kubernetes
1. Optional but highly recommended:  
  - It’s a good idea to setup a K8S cluster in a production manner.  
  - To do so, I recommend using kubeadm but you can do however you like according to K8S documentation:  
    - https://kubernetes.io/docs/setup/production-environment/
    - https://kubernetes.io/docs/setup/production-environment/tools/  
2. Optional:  
  - Setup a reverse proxy and host everything that we will create from this point forward, behind it.  
3. Main:  
  - Setup a private registry with authentication for docker.  
  - Create a namespace called “wordpress”.  
  - Setup our own wordpress site on your K8S cluster and expose it to outside.  
  - Restart & update wordpress to see what will happen.
### Helpful Resources
- [Kubernetescreate-cluster-with-kubeadm](https://kubernetes.io/docs/setup/production-environment/tools/kubeadm/create-cluster-kubeadm/)
- [disable-swap](https://tecadmin.net/disable-swapfile-on-ubuntu/)
- [anton-putra](https://www.youtube.com/playlist?list=PLiMWaCMwGJXnHmccp2xlBENZ1xr4FpjXF)
- [containers-from-the-coach](https://www.youtube.com/watch?v=iC-WxZGhFqs)

## Task-6: Build an Image and Push It to Container Registry
We need to have 2 new tools to go further with our laboratory puzzle (The 1st piece was a healthy K8S cluster):
  - a private git service
  - a private docker registry service
  - Both of the above services can be deployed with GitLab.  
  - For the second one, you can also use other tools like Nexus, but we MUST have authentication for these services to simulate a production environment.  
  - After running these services, you need to import the repository in the 2nd part of the Docker tutorial (Get started - Part 2: Containerize an application) into a repository on your own GitLab.  
  - Now, create a 1.0.0 tag from the master branch and build the project with the same tag and push the created image to your own Docker registry.  
  - **NOTE:** It's a good idea to set up all of your services with some sort of domain (Valid like .com or .ir OR Invalid like .local or .lab).  
  - In the case of a valid domain, you can use services like Arvancloud or Cloudflare for DNS (It's free to use. This is on you to learn how to work with them).  
  - Using an invalid domain requires setting the required record on all of your infrastructure in `/etc/hosts` file and beware that you will face a lot of issues related to TLS (SSL).  
  - We didn't cover reverse proxy yet, which you may need for this to have a clean setup; don't worry, we have a good task for this when we do cover it.
### Helpful Resources
- [Installing self-managed GitLab](https://about.gitlab.com/install/)
- [GitLab CI/CD learning](https://www.youtube.com/playlist?list=PLYrn63eEqAzannVocQrddqsBK-C17e-Sm)
- [Containerization](https://docs.docker.com/language/)
- [Clone to GitLab](https://docs.gitlab.com/ee/administration/settings/import_and_export_settings.html#configure-allowed-import-sources)
- [Add swap](https://www.digitalocean.com/community/tutorial-collections/how-to-add-swap-space)

## Task-7:

