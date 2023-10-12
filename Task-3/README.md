# HAProxy, SQL, and NoSQL Setup Guide 🏰

Welcome to Task 3's HAProxy, SQL, and NoSQL setup guide. this document will help you navigate the complexities of configuring HAProxy, SQL, and NoSQL for your environment.

## Subfolders Overview 📂

### HAProxy-Learning (optional) 📚

1. **Create 3 Nginx Containers**: Begin by creating three Nginx containers.

2. **Configure Nginx Containers Equally**: Ensure that all Nginx containers are configured identically and serve a static page on each of them.

3. **Specify Instance-Specific Content**: Customize the content on each Nginx node to differentiate between them.

4. **Install HAProxy**: Create a fourth Ubuntu container and install HAProxy on it.

5. **Configure HAProxy Load Balancing**: Configure HAProxy to respond to the localhost URL and balance the load among the Nginx containers.

### HAProxy-Task (main) 🎯

1. **Create 3 VMs & Install Nginx**: Start by creating three virtual machines (VMs) and installing Nginx on each of them.

2. **Configure Nginx Instances Equally**: Ensure that all Nginx instances are configured in the same way and serve a static page on each one.

3. **Specify Instance-Specific Content**: Customize the content on each Nginx node to help identify which one you are accessing.

4. **Install HAProxy**: Create a fourth VM and install HAProxy on it.

5. **Configure HAProxy Load Balancing**: Configure HAProxy to respond to a specific URL and balance the load among the Nginx instances.

6. **Enhance HAProxy Configuration**: Reconfigure HAProxy to respond to the same URL but with three different paths, each connecting to a separate Nginx instance.

7. **Multiple URL Configuration**: Further reconfigure HAProxy to respond to different URLs, with each URL connecting to a different Nginx instance.

### SQL-Task 🎯

1. **MySQL/MariaDB Setup**: Set up a single MySQL/MariaDB node with the default configuration. Secure it so that only authentication (root user) from localhost is allowed. Create databases, tables, and insert data for experimentation.

2. **Create a Slave Node**: Configure a slave node. Understand where to place configurations for the master to ensure readability.

3. **Master-Slave Role Switch**: Experiment by intentionally corrupting your master node and switching your slave to act as the new master. Recover the old master and set it up as the new slave to switch master and slave roles between your two nodes.

4. **Implement for WordPress Service**: Apply what you've learned to create a slave for your WordPress service and follow the same procedures described in section 3 for this service. You can choose to set up VMs, install required services, or use Docker for this task, or even combine both approaches.

### NoSQL-Task 🎯

To understand the complete picture, read about the Raft protocol and identify suitable filesystems for various scenarios. Regarding the task itself:

1. **MongoDB Setup**: Perform necessary kernel tuning for MongoDB and install a single instance. Get hands-on experience with it.

2. **Replica Set Cluster**: Set up a MongoDB replica set cluster with an appropriate number of nodes.

3. **Data Manipulation**: Like with MySQL, create databases, insert data, perform updates, and more. It's advisable to create a simple Python application to see how applications communicate with MongoDB.

4. **Authentication Configuration**: Finally, configure your current replica set to enable authentication for communication with MongoDB.
