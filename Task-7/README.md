# Main Task
I've did this in a more complex another [task](https://github.com/mhesfahani97/Self-DevOps-BootCamp-1/tree/main/Task-2).

# Optional Task
1. servers
  - localhost for prometheus and grafana
  - a digital ocean droplet as node exporter

2. linux server exposer 
  - download exposer  
    `wget https://github.com/prometheus/node_exporter/releases/download/v1.7.0/node_exporter-1.7.0.linux-amd64.tar.gz`
  - extract it  
      `tar xvf node_exporter-1.7.0.linux-amd64.tar.gz`
  - persist the binary file in reboots
      ```
      cd node_exporter-1.7.0.linux-amd64
      sudo cp node_exporter /usr/local/bin
      ```
  - add user for running node exporter
      ```
      sudo useradd --no-create-home --shell /bin/false node_exporter
      sudo chown node_exporter:node_exporter /usr/local/bin/node_exporter
      ```
  - To ensure Node Exporter automatically starts on server reboot, configure the systemd service:
      `sudo vim /etc/systemd/system/node_exporter.service`  
      insert it:  
      ```
      [Unit]
      Description=Node Exporter
      Wants=network-online.target
      After=network-online.target
    
      [Service]
      User=node_exporter
      Group=node_exporter
      Type=simple
      ExecStart=/usr/local/bin/node_exporter
      Restart=always
      RestartSec=3
        
      [Install]
      WantedBy=multi-user.target
      ```
      save it
      ```
      sudo systemctl daemon-reload
      sudo systemctl enable node_exporter
      sudo systemctl start node_exporter
      sudo systemctl status node_exporter.service
      ```

3. monitoring
  - deploy prometheus  
      `docker compose -f prometheus-compose.yml up -d`
  - deploy grafana  
    `docker compose -f grafana-compose.yml up -d`  
    login to grafana by `localhost:3000`  
    add prometheus data source with http connection, save & test  
    import 1860 dashboard
