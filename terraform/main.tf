# module "app" {
#   source = "./app"

#   vm_name       = "cytech-2-app"
#   dedicated_mem = 512
#   vcpu_number   = 1
#   ip_vm = "192.168.100.122/24"
#   ssh_key = "/home/cytech/.ssh/id_rsa.pub"


#   node_name    = "mgmt"
#   pool_id      = "cytech"
#   bridge       = "vmbr0"
#   stop_destroy = true
#   count_vm     = 1

# }

module "bdd" {
  source = "./bdd"

  vm_name       = "cytech-2-bdd"
  dedicated_mem = 2048
  vcpu_number   = 1
  ssh_key = "/home/cytech/.ssh/id_rsa.pub"
  ip_vm = "192.168.100.123/24"



  node_name    = "mgmt"
  pool_id      = "cytech"
  bridge       = "vmbr0"
  stop_destroy = true
  count_vm     = 1

}