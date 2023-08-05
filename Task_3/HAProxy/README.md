# Load Balanced Nginx Setup with HAProxy and Docker Compose

This folder contains a simple setup for load balancing using Docker Compose, Nginx, and HAProxy. The setup consists of three Nginx containers acting as servers, and an Ubuntu server container with HAProxy for load balancing. Incoming requests to the Ubuntu server container will be evenly distributed among the three Nginx server containers, providing efficient handling of client responses.

## Setup Steps:

Follow these steps to set up the load balancing environment:

1. **Clone Repository:**
    ```
    git clone https://github.com/mhesfahani97/DigiNext-DevOps-BootCamp.git
    cd your-repo
    ```

2. **Create Docker Compose Configuration:**
    Create a `docker-compose.yml` file.

3. **Prepare HTML Files:**
    In the `index` folder, create `index1.html`, `index2.html`, and `index3.html` files. These files will be used to display the container numbers for demonstration purposes.

4. **Configure Nginx:**
    Create an `nginx.conf` file to configure Nginx settings. Make sure to define the appropriate upstream servers for load balancing.

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

7. **Access the Load Balanced Application:**
    Open a web browser and navigate to the Ubuntu server container's IP or hostname. You will see that requests are evenly distributed among the Nginx servers.

Feel free to customize the configuration and explore further optimizations based on your requirements.

**Note:** This is a simplified example for educational purposes. In real-world scenarios, additional configurations and security considerations are essential.

## License

This project is licensed under the [MIT License](LICENSE).

