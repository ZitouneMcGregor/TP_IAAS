#APP

variable "app_vm_name" {
  description = "Nom de la vm"
  type        = string
  default     = "cytech-2"
}

variable "app_node_name" {
  description = "Nom de la node"
  type        = string
  default     = "mgmt"
}

variable "app_pool_id" {
  description = "pool id"
  type        = string
  default     = "cytech"
}

variable "app_dedicated_mem" {
  description = "Dedicated memory"
  type        = number
  default     = 1024
}

variable "app_bridge" {
  description = "bridge"
  type        = string
  default     = "vmbr0"
}

variable "app_stop_destroy" {
  description = "stop on destroy"
  type        = bool
  default     = true
}

variable "app_count_vm" {
  description = "count"
  type        = number
  default     = 1
}

variable "app_vcpu_number" {
  description = "nombre de vcpus"
  type        = number
  default     = 1
}

variable "app_ssh_key" {
  description = "clé ssh"
  type        = string
  default     = "/home/cytech/.ssh/id_rsa.pub"
}

variable "app_ip_vm" {
  description = "IP de la VM"
  type        = string
  default     = "192.168.100.122/24"
}

variable "app_disk_size" {
  description = "taille du disque en Go"
  type        = number
  default     = 20
}

# BDD

variable "bdd_vm_name" {
  description = "Nom de la vm"
  type        = string
  default     = "cytech-2"
}

variable "bdd_node_name" {
  description = "Nom de la node"
  type        = string
  default     = "mgmt"
}

variable "bdd_pool_id" {
  description = "pool id"
  type        = string
  default     = "cytech"
}

variable "bdd_dedicated_mem" {
  description = "Dedicated memory"
  type        = number
  default     = 1024
}

variable "bdd_bridge" {
  description = "bridge"
  type        = string
  default     = "vmbr0"
}

variable "bdd_stop_destroy" {
  description = "stop on destroy"
  type        = bool
  default     = true
}

variable "bdd_count_vm" {
  description = "count"
  type        = number
  default     = 1
}

variable "bdd_vcpu_number" {
  description = "nombre de vcpus"
  type        = number
  default     = 1
}

variable "bdd_ssh_key" {
  description = "clé ssh"
  type        = string
  default     = "/home/cytech/.ssh/id_rsa.pub"
}

variable "bdd_ip_vm" {
  description = "IP de la VM"
  type        = string
  default     = "192.168.100.123/24"
}

variable "bdd_disk_size" {
  description = "taille du disque en Go"
  type        = number
  default     = 20
}

# Variables pour créer le inventory

variable "app_ip_vm_inv" {
  description = "IP de la VM pour l'inventory"
  type        = string
  default     = "192.168.100.122"
}

variable "bdd_ip_vm_inv" {
  description = "IP de la VM pour l'inventory"
  type        = string
  default     = "192.168.100.123"
}