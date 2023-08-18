# Setting Up VMs with Nginx and HAProxy for Load Balancing

This repository provides a guide to set up four Virtual Machines (VMs) with different types of networks, along with the installation of Nginx on VM1, VM2, and VM3, and HAProxy on VM4 for load balancing. The steps below will walk you through the entire process.

## VM Setup

To create the four VMs, you can use the provided `install_vm.sh` script.

For detailed instructions on using the script, refer to the [install_vm.sh script](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/blob/main/Task_1/VM_Task/install_vm.sh).

Two types of networks are configured for these VMs. For more information about the network configurations, please refer to the [Task_1 folder](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/tree/main/Task_1) or the [wiki](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/wiki/Task_1) section.

## VM Configuration

Follow these steps to configure the VMs:

### VM2 Configuration for VM4

Use VM2 configuration in Task_1 for VM4 in this task.

### VM1 Configuration for VM1, VM2, and VM3

Use VM2 configuration in Task_1 for VM1, VM2 and VM3 in this task.

## Nginx Installation

Nginx will be installed on VM1, VM2, and VM3 to serve as the web server in load balancing. Here's how:

1. SSH into VM1, VM2, and VM3 or run.
```bash
virsh console vm1
virsh console vm2
virsh console vm3
```
2. Run the following command on each VM:

```bash
vim /var/www/html/index.html
```

3. Paste the content from one of the three index files available in the `./index` directory for each VM.

4. Configure Nginx by running:

```bash
sudo vim /etc/nginx/conf.d/nginx.conf
```

5. Copy the contents of the provided `nginx.conf` into the `nginx.conf` file on each VM.

6. Test the Nginx configuration by running the following command on each VM:

```bash
nginx -t -c /path/to/conf/nginx.conf
```
If you have any problem with nginx you can see Task_2

## HAProxy Installation and Load Balancing

Install HAProxy on VM4 to perform load balancing between VM1, VM2, and VM3.

1. SSH into VM4.
2. Configure HAProxy by running:

```bash
sudo vim /etc/haproxy/haproxy.cfg
```

3. Copy the configuration settings from one of the provided config files into the `haproxy.cfg` file.

4. Start the HAProxy service:

```bash
sudo service haproxy start
```
If you have any question about `haproxy1.cfg` you can see [this](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/wiki/Task_3#haproxy_learninghaproxycfg-) and if you have any question about `haproxy2.cfg` you can see [wiki](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/wiki) part.

5. Verify load balancing by running the following command on VM4:

```bash
curl localhost # for haproxy1.cfg

curl localhost/a #for haproxy2.cfg
curl localhost/b
```

This should demonstrate load balancing between VM1, VM2, and VM3.

**Congratulations!** You have successfully set up four VMs with different network configurations, installed Nginx on VM1, VM2, and VM3, and set up HAProxy on VM4 for load balancing.

For more detailed instructions and resources, please refer to the [Wiki](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/wiki) in the repository.
