# Let's Get Started with HAProxy-Task 🛠️

## Creating VMs
   - To set up the four VMs required for this task, you can conveniently employ the provided `install-vm.sh` script.

## VM4 Configuration
   - Utilize the VM2 configuration used in Task-1 for VM4 in this task.
   - VM4 will serve as the gateway to the internet for the other VMs.

## VM1, VM2, and VM3 Configuration
   - Employ the VM1 configuration used in Task-1 for VM1, VM2, and VM3 in this task.
   - Ensure that you assign a unique static IP to each of these VMs.

# Nginx Installation
  - Nginx will be installed on VM1, VM2, and VM3 to act as the web server for load balancing. Here's the process:

    1. SSH into VM1, VM2, and VM3 or use the `virsh console` commands.
      ```bash
      virsh console vm1
      virsh console vm2
      virsh console vm3
      ```

    2. Modify the index file contents on each VM:
      ```bash
      vim /var/www/html/index.html
      ```
      Paste the content from one of the three index files located in the `./index` directory onto each VM.

    3. Configure Nginx:
      ```bash
      sudo vim /etc/nginx/conf.d/nginx.conf
      ```
      Copy the provided `nginx.conf` contents into the `nginx.conf` file on each VM.

    4. To test the Nginx configuration, run the following command on each VM:
      ```bash
      nginx -t -c /path/to/conf/nginx.conf
      ```

# HAProxy Installation and Load Balancing 
    
1. Install HAProxy on VM4 to facilitate load balancing between VM1, VM2, and VM3.

2. Configure HAProxy by executing:
      ```bash
      sudo vim /etc/haproxy/haproxy.cfg
      ```
      Transfer the configuration settings from one of the provided config files to the `./haproxy.cfg` folder.

3. Start the HAProxy service:
      ```bash
      sudo service haproxy start
      ```

4. Verify load balancing by running the following commands on VM4:
    
      ```bash
      # For haproxy1.cfg
      curl localhost 
      # For haproxy2.cfg
      curl localhost/a 
      curl localhost/b
      ```
      These commands should demonstrate load balancing between VM1, VM2, and VM3 effectively.

** part 7 of this task should be done in the future! so it is not completed **
