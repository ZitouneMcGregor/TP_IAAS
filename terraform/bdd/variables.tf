variable "vm_name" {
  description = "Nom de la vm"
  type        = string
  default     = "cytech-2"
}

variable "node_name" {
  description = "Nom de la node"
  type        = string
  default     = "mgmt"
}

variable "pool_id" {
  description = "pool id"
  type        = string
  default     = "cytech"
}

variable "dedicated_mem" {
  description = "Dedicated memory"
  type        = number
  default     = 1024
}

variable "bridge" {
  description = "bridge"
  type        = string
  default     = "vmbr0"
}

variable "stop_destroy" {
  description = "stop on destroy"
  type        = bool
  default     = true
}

variable "count_vm" {
  description = "count"
  type        = number
  default     = 1
}

variable "vcpu_number" {
  description = "nombre de vcpus"
  type = number
  default = 1
}

variable "ssh_key" {
  description = "clé ssh"
  type = string
  default = "/home/cytech/.ssh/id_rsa.pub"
}

variable "ip_vm" {
  description = "IP de la VM"
  type = string
  default = "192.168.100.123/24"
}

variable "disk_size" {
  description = "taille du disque en Go"
  type = number
  default = 20
}