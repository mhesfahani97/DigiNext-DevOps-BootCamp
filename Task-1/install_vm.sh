#!/bin/bash

# virtual machine names (vms) and network names (nts)
vms=("vm1" "vm2")
nts=("nt1" "nt2")

# Loop through network names and perform network setup
for nt_name in "${nts[@]}"; do
    virsh net-define ./networks/"$nt_name".xml
    virsh net-start "$nt_name"
    virsh net-autostart "$nt_name"
done

# List all defined networks
virsh net-list --all

# Create virtual machine disks
for vm_name in "${vms[@]}"; do
    # Create disk image for the virtual machine
    qemu-img create -f qcow2 ./vm_disks/"$vm_name".qcow2 10G
done

# Loop through virtual machine names for installation
for vm_name in "${vms[@]}"; do
    # Check if the current VM is not the last in the array
    if [ "${vms[-1]}" != "${vm_name}" ]; then
        # Install VM in a separate terminal
        gnome-terminal -- bash -c "virt-install \
            --name "$vm_name" \
            --memory 2048 \
            --vcpus 1 \
            --disk path=./vm_disks/"$vm_name".qcow2,format=qcow2 \
            --network network=nt1,model=virtio \
            --graphics none \
            --console pty,target_type=serial \
            --location ~/soft_ware_work_skill/ubuntu/* \
            --extra-args='console=ttyS0,115200n8 serial'"
        
        # Prompt user to continue or skip installation
        read -p "If you have installed $vm_name, press 'y' to start the next installation, or any other key to skip : " answer
        # Display VM information
        virsh dominfo "$vm_name"
        if [ "$answer" != "y" ]; then
            echo "skipping the next installation ... "
            break
        fi
    else
        # Install last VM with two network interfaces
        gnome-terminal -- bash -c "virt-install \
            --name "$vm_name" \
            --memory 2048 \
            --vcpus 1 \
            --disk path=./vm_disks/"$vm_name".qcow2,format=qcow2 \
            --network network=nt1,model=virtio \
            --network network=nt2,model=virtio \
            --graphics none \
            --console pty,target_type=serial \
            --location ~/soft_ware_work_skill/ubuntu/* \
            --extra-args='console=ttyS0,115200n8 serial'"
        
        # Wait for user input after installation completion
        read -p "$vm_name, is installing. When installation is finished, please enter 'y' : " answer
        if [ "$answer" == "y" ]; then
            # Display VM information
            virsh dominfo "$vm_name"
            echo "Installation finished."
        fi
    fi
done

# List all virtual machines
virsh list --all

# Display network interfaces of each virtual machine
for vm_name in "${vms[@]}"; do
    echo "$vm_name :"
    echo 
    virsh domiflist "$vm_name"
done
