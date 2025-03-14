data "proxmox_virtual_environment_pool" "cytech" {
  pool_id = var.pool_id
}

data "local_file" "ssh_public_key" {
    filename = var.ssh_key
}