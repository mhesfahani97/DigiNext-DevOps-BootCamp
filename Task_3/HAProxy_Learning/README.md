# Setup Steps:

Follow these steps to set up the load balancing environment:

1. **Clone Repository:**
    ```
    git clone https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp.git
    cd your-repo-here
    ```

2. **Test Nginx Configuration:**
    Before proceeding, validate the Nginx configuration by running.
    ```
    nginx -t -c /path/to/conf/nginx.conf
    ```
    it should give you an error, but it's valid! think why? 

3. **Launch Containers:**
    Start the containers and check them.
    ```
    docker-compose up -d
    ```

    ```
    docker-compose ps -a
    ```

4. **setup HAProxy in ubuntu container:**
   ```
   docker exec -it haproxy /bin/bash
   apt update
   apt upgrade
   apt install haproxy
   apt install vim
   vim /etc/haproxy/haproxy.cfg
   ```
   edit it such as haproxy.cfg in this folder, we can't use a volume for it, because it used ubuntu image not haproxy image.
   ```
   haproxy -c -f /etc/haproxy/haproxy.cfg
   ```
   
   ```
   service haproxy start
   ```
    
Feel free to customize the configuration and explore further optimizations based on your requirements.

**Note:** This is a simplified example for educational purposes. In real-world scenarios, additional configurations and security considerations are essential.

## License

This project is licensed under the [MIT License](LICENSE).

