# Task 3: HAProxy, SQL, NoSQL Adventures 🏰

Welcome to Task 3's kingdom of HAProxy, SQL and NoSQL magic! In this folder, we've got six subfolders that will take us on an adventure through HAProxy, SQL and NoSQL.

## Subfolders Overview 📂

### HAProxy_Learning 📚

1. Create 3 Nginx containers.
2. Configure all Nginx containers equaly and serve a static page on each of them.
3. Specify an instance-specific content on each node, enableing you to diffrentative which one you’re accessing.
4. Create a forth Ubuntu container and install HAproxy on it.
5. Configure the HAproxy to respond on the localhost URL and balance the load among those Nginx containers.

### HAProxy_Task 🎯

1. Create 3 VMs & install Nginx on each of them.
2. Configure all Nginx instances equally and serve a static page on each one.
3. Specify an instance-specific content on each node, allowing you to determine which one you are accessing.
4. Create a forth VM and install HAproxy on it.
5. Configure the HAproxy to respond on a specific URL and balance the load among the Nginx instances.
6. Reconfigure the HAproxy to respond on the same URL but with 3 different path, each connecting to a seprate Nginx instances.
7. Reconfigure the HAproxy to respond on the different URLs, with each URL connecting to a different Nginx instance. 

### SQL_Task 🎯

1. Setup a single MySQL/MariaDB node without any configurations (default configuration). Secure it so you could only be able to connect to it by authentication (root user MUST only be able to connect to it from localhost). Create some databases and within these databases, create some tables and then insert some data in these tables (Play with it).
2. Now lets create a slave node. you need to set some configuration for your master (read where you can put your configurations and what is the best way to do so to make it easy to eyes for read).
3. In which way you desire, corrupt your master node and then change your slave to be act as new master node and then recover your old master node and set it up to be your new slave (switch master & slave roles between your 2 nodes).
4. Now let's use what we did in last task and create a slave for our wordpress service and do as described in section 3 of this task, on this service.
***NOTE:*** It's not important that you want to setup some VMs and install required services OR use docker for this task. I recommend to do both of them or event combine it (master on docker and slave on VM and vice versa)

### NoSQL_Task 🎯
To understand the whole picture, please read with details about raft protocol and also it's important to know which filesystem is suitable for which scenario. About the task itself:
1. Perform required kernel tuning for MongoDB and install a single instance and work a little with it.
2. Setup a replica set cluster with appropriate number of nodes.
3. Like we did with MySQL, create DB, insert, update, ... datat to them. It's better to create a simple python app for this to see how applications communicate with MongoDB.
4. Finally, configure your current replicaset to enable authentication to communicate with MongoDB.

## How to Use 🛠️

1. Start by exploring the Learning subfolders.

2. Once you feel confident in your knowledge, venture into the Task subfolders. Get your hands dirty with real-world tasks and challenges.

3. Don't forget to check out the [GitHub Wiki](https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp/wiki) for detailed explanations, step-by-step guides.

Now, grab your load balancers and let's balance our way to glory! 🌐🏹

