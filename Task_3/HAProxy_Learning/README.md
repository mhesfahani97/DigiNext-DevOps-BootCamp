# Setup Steps:

Follow these steps to set up the load balancing environment:

1. **Clone Repository:**
    ```
    git clone https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp.git
    cd your-repo-here
    ```

2. **Check Docker Compose Configuration:**
    It's clear and simple, if you can't understand, got wiki part.

3. **Check HTML Files:**
    In the `index` folder. These files will be used to display the container numbers for demonstration purposes.

4. **Check Nginx Configuration:**
    This file is for configuring Nginx settings.

5. **Test Nginx Configuration:**
    Before proceeding, validate the Nginx configuration by running:
    ```
    nginx -t -c /path/to/conf/nginx.conf
    ```

6. **Launch Containers:**
    Start the containers using Docker Compose:
    ```
    docker-compose up -d
    ```

7. docker exec -it haproxy /bin/bash

8. apt update

9. apt upgrade

10. vim /etc/haproxy/haproxy.cfg
14. edit it such as haproxy.cfg in this folder
15.haproxy -c -f /etc/haproxy/haproxy.cfg for checking the haproxy config file 
    
Feel free to customize the configuration and explore further optimizations based on your requirements.

**Note:** This is a simplified example for educational purposes. In real-world scenarios, additional configurations and security considerations are essential.

## License

This project is licensed under the [MIT License](LICENSE).

