resource "proxmox_virtual_environment_vm" "ubuntu_vm" {

  count     = var.count_vm
  name = var.vm_name
  node_name = var.node_name
  pool_id   = data.proxmox_virtual_environment_pool.cytech.pool_id

  cpu {
    cores = var.vcpu_number
  }

  agent {
    enabled = true
  }

  memory {
    dedicated = var.dedicated_mem
  }

  disk {
    datastore_id = "raid-ssd"
    file_id      = "isos:iso/jammy-server-cloudimg-amd64.img"
    interface    = "virtio0"
    iothread     = true
    discard      = "on"
    size         = var.disk_size
  }

  network_device {
    bridge = var.bridge
  }

  stop_on_destroy = var.stop_destroy

  #122 123
  initialization {
    datastore_id = "raid-ssd"
    ip_config {
      ipv4 {
        address = var.ip_vm
        gateway = "192.168.100.1"
      }
    }

    user_data_file_id = proxmox_virtual_environment_file.user_data_cloud_config.id
    
    user_account {
        username = "ubuntu"
        keys = [trimspace(data.local_file.ssh_public_key.content)]
    }
  }

}


resource "proxmox_virtual_environment_file" "user_data_cloud_config" {
  content_type = "snippets"
  datastore_id = "local"
  node_name    = "mgmt"

  source_raw {
    data = <<-EOF
    #cloud-config
    hostname: test-ubuntu
    users:
      - default
      - name: ubuntu
        groups:
          - sudo
        shell: /bin/bash
        ssh_authorized_keys:
          - ${trimspace(data.local_file.ssh_public_key.content)}
        sudo: ALL=(ALL) NOPASSWD:ALL
    runcmd:
        - apt update
        - apt install -y qemu-guest-agent net-tools
        - timedatectl set-timezone America/Toronto
        - systemctl enable qemu-guest-agent
        - systemctl start qemu-guest-agent
        - echo "done" > /tmp/cloud-config.done
    EOF

    file_name = "user-data-cloud-config-cytech-2.yaml"
  }
}


output "Nom" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].name
}

output "RAM" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].memory[0].dedicated
}

output "vCPU" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].cpu[0].cores
}

output "Disque" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].disk[0].size
}

output "OS" {
  value = "ubuntu"
}

output "IP" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].initialization[0].ip_config[0].ipv4[0].address
}

output "id" {
  value = proxmox_virtual_environment_vm.ubuntu_vm[*].id
}