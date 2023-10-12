# Let's Get Started with HAProxy-Learning 🛠️
Follow these steps to set up the load balancing environment:

1. **Clone Repository:**
    ```
    git clone https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp.git
    cd your-repo-here
    ```

2. **Test Nginx Configuration:**
    Before proceeding, validate the Nginx configuration by running this command.
    ```
    nginx -t -c /path/to/conf/nginx.conf
    ```
    it should give you an error, but it's valid! think why? 

3. **Launch Containers:**
    Start the containers and check them.
    ```
    docker-compose up -d
    ```
    ![](https://raw.githubusercontent.com/mhesfahani97/DigiNext-DevOps-BootCamp/main/Task_3/HAProxy_Learning/pictures/1.png)
    ```
    docker-compose ps -a
    ```
    ![](https://raw.githubusercontent.com/mhesfahani97/DigiNext-DevOps-BootCamp/main/Task_3/HAProxy_Learning/pictures/2.png)
4. **setup HAProxy in ubuntu container:**
   ```
   docker exec -it haproxy /bin/bash
   apt update
   apt upgrade
   apt install haproxy
   apt install vim
   vim /etc/haproxy/haproxy.cfg
   ```
   edit it such as haproxy.cfg in this folder, we can't use a volume for it, because it used ubuntu image, not haproxy image.
   ```
   haproxy -c -f /etc/haproxy/haproxy.cfg
   ```
   ![](https://raw.githubusercontent.com/mhesfahani97/DigiNext-DevOps-BootCamp/main/Task_3/HAProxy_Learning/pictures/3.png) 
   ```
   service haproxy start
   ```
   ![](https://raw.githubusercontent.com/mhesfahani97/DigiNext-DevOps-BootCamp/main/Task_3/HAProxy_Learning/pictures/4.png) 
5. **Test It**
    run this command multiple times to see the balancing.
    ```
    curl 127.0.0.1:8084
    ```
    ![](https://raw.githubusercontent.com/mhesfahani97/DigiNext-DevOps-BootCamp/main/Task_3/HAProxy_Learning/pictures/5.png)
