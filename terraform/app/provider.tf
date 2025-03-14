terraform {
  required_providers {
    proxmox = {
      source  = "bpg/proxmox"
      version = "0.73.0"
    }
  }
}

provider "proxmox" {
  endpoint = "https://192.168.100.12:8006/"
  insecure = true
  username = "cytech-2@pam"
  password = "cytech"

  ssh {
    username = "cytech"
    agent    = true
  }
}