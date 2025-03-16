# APP
app_vm_name       = "cytech-2-app"
app_dedicated_mem = 1024
app_vcpu_number   = 1
app_ip_vm         = "192.168.100.122/24"
app_ssh_key       = "/home/cytech/.ssh/id_rsa.pub"
app_node_name     = "mgmt"
app_pool_id       = "cytech"
app_bridge        = "vmbr0"
app_stop_destroy  = true
app_count_vm      = 1
app_disk_size     = 20

# BDD
bdd_vm_name       = "cytech-2-bdd"
bdd_dedicated_mem = 2048
bdd_vcpu_number   = 1
bdd_ssh_key       = "/home/cytech/.ssh/id_rsa.pub"
bdd_ip_vm         = "192.168.100.123/24"
bdd_node_name     = "mgmt"
bdd_pool_id       = "cytech"
bdd_bridge        = "vmbr0"
bdd_stop_destroy  = true
bdd_count_vm      = 1
bdd_disk_size     = 20

# Inventory
app_ip_vm_inv = "192.168.100.122"
bdd_ip_vm_inv = "192.168.100.123"