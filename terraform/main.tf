module "app" {
  source = "./app"

  vm_name       = var.app_vm_name
  dedicated_mem = var.app_dedicated_mem
  vcpu_number   = var.app_vcpu_number
  ip_vm         = var.app_ip_vm
  ssh_key       = var.app_ssh_key
  node_name    = var.app_node_name
  pool_id      = var.app_pool_id
  bridge       = var.app_bridge
  stop_destroy = var.app_stop_destroy
  count_vm     = var.app_count_vm

}

module "bdd" {
  source = "./bdd"

  vm_name       = var.bdd_vm_name
  dedicated_mem = var.bdd_dedicated_mem
  vcpu_number   = var.bdd_vcpu_number
  ip_vm         = var.bdd_ip_vm
  ssh_key       = var.bdd_ssh_key
  node_name    = var.bdd_node_name
  pool_id      = var.bdd_pool_id
  bridge       = var.bdd_bridge
  stop_destroy = var.bdd_stop_destroy
  count_vm     = var.bdd_count_vm

}

resource "local_file" "ansible_inventory" {

  filename = "${path.module}/../ansible/inventory.ini"
  content = <<EOF
[app]
host-app ansible_host=${chomp(var.app_ip_vm_inv)} ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'

[bdd]
host-bdd ansible_host=${chomp(var.bdd_ip_vm_inv)} ansible_user=ubuntu ansible_ssh_common_args='-o StrictHostKeyChecking=no -o UserKnownHostsFile=/dev/null'
EOF
}

resource "null_resource" "run_ansible" {
  depends_on = [
    module.app, 
    module.bdd,
    local_file.ansible_inventory
  ]

  provisioner "local-exec" {
    command = <<EOT
      ansible-playbook -i ${local_file.ansible_inventory.filename} ${path.module}/../ansible/main.yml
    EOT
  }
}