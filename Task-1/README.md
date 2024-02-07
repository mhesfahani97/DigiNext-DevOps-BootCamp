# Prerequisites

- You should have both VMs (`vm1` and `vm2`) already installed using the provided `install_vm.sh` script.
- Network configuration files `nt1.xml` and `nt2.xml` are located in the `networks` folder.

# Task-1.1

## VM2 Configuration

1. Access the console of `vm2` using the command: `virsh console vm2`.

2. Update `vm2` using the following commands:
    ```bash
    sudo apt-get update
    sudo apt-get upgrade
    ```

3. Enable internet sharing on `vm2` by editing `/etc/sysctl.conf`:
    - Uncomment the line `net.ipv4.ip_forward=1`.
    - Save the file and execute: `sudo sysctl -p`.

4. Set up iptables to allow internet sharing:
    ```bash
    sudo iptables -F
    sudo iptables -t nat -F
    sudo iptables -t nat -A POSTROUTING -o enp2s0 -j MASQUERADE
    sudo iptables -A FORWARD -i enp1s0 -o enp2s0 -j ACCEPT
    sudo iptables -A FORWARD -i enp2s0 -o enp1s0 -m state --state RELATED,ESTABLISHED -j ACCEPT
    ```

5. Install `iptables-persistent` to persist changes:
    ```bash
    sudo apt-get install iptables-persistent
    ```

6. Configure a static IP address for `vm2`:
    ```bash
    sudo ip address add 192.168.100.3/24 dev enp1s0
    sudo ip link set enp1s0 up
    ```

7. Configure the network using `netplan`:
    - Edit `/etc/netplan/*` and replace the content with:
    ```yaml
    # This is the network config written by 'subiquity'
    network:
      ethernets:
        enp1s0:
          dhcp4: no
          addresses: [192.168.100.3/24]
          nameservers:
            addresses: [8.8.8.8, 8.8.8.4]
        enp2s0:
          dhcp4: true
      version: 2
    ```
    Apply the changes: `sudo netplan try`.

## VM1 Configuration

1. Configure a static IP address for `vm1`:
    ```bash
    sudo ip address add 192.168.100.2/24 dev enp1s0
    sudo ip link set enp1s0 up
    ```

2. Configure the network using `netplan`:
    - Edit `/etc/netplan/*` and replace the content with:
    ```yaml
    # This is the network config written by 'subiquity'
    network:
        ethernets:
          enp1s0:
            dhcp4: no
            addresses: [192.168.100.2/24]
            routes:
              - to: default
                via: 192.168.100.3
            nameservers:
              addresses: [8.8.8.8, 8.8.8.4]
    ```
    Apply the changes: `sudo netplan try`.

3. Update and upgrade `vm1`:
    ```bash
    sudo apt-get update
    sudo apt-get upgrade
    ```
# Task1.2

1. **Create VPSs**
    - VPS1 in netherlands(167.172.35.173)
    - VPS2 in iran(185.129.118.0)

2. **Create Proxy Server**
    - install squid 
        ```bash
        sudo apt-get update
        sudo apt-get install squid
        ```
    - configure squid 
        ```bash
        cp /etc/squid/squid.conf /etc/squid/squid.conf.org
        vim /etc/squid/squid.conf
        ```
        add `http_port 3128` after `TAG: http_port`  
        add `acl gitlab src 185.129.118.0/25` after `TAG: acl`  
        add `http_access allow gitlab` after `TAG: http_access`  
        add `access_log /var/log/squid/access.log squid` after `TAG: access_log`  
    - start squid by `sudo systemctl start squid`
    - check squid status is running by `sudo systemctl status squid`

3. **Proxy the VPS2**
    - set proxy just for a user:
        `vim ~/.bashrc`
        add these:
        ```
        export HTTP_PROXY="167.172.35.173:3128/"
        export HTTPS_PROXY="167.172.35.173:3128/"
        export NO_PROXY="localhost,127.0.0.1,::1"
        ```
    - set proxy for all users:
        `vim /etc/environment`
        add these:
        ```bash
        export HTTP_PROXY="167.172.35.173:3128/"
        export HTTPS_PROXY="167.172.35.173:3128/"
        export NO_PROXY="localhost,127.0.0.1,::1"
        ```
    - set proxy for package manager
        `vim /etc/apt/apt.conf`
        add these:
        ```bash
        Acquire::http::Proxy "http://167.172.35.173:3128";
        Acquire::https::Proxy "http://167.172.35.173:3128";
        ```
    - reboot the system
