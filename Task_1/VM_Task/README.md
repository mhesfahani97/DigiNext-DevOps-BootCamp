# Setup Guide

## Introduction

This guide will walk you through the process of setting up a virtual network of two VMs, where VM2 acts as a gateway to provide internet connectivity to VM1. This setup involves using the provided `install_vm.sh` script along with configuration changes on both VMs.

### Prerequisites

- You should have both VMs (`vm1` and `vm2`) already installed using the provided `install_vm.sh` script.
- Network configuration files `nt1.xml` and `nt2.xml` are located in the `networks` folder.

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

## Conclusion

By following these steps, you have successfully set up a virtual network where `vm2` acts as a gateway, providing internet connectivity to `vm1`. You can now enjoy internet access on `vm1`.

For any further assistance or troubleshooting, feel free to reach out!

