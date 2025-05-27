locals {
  kubernetes = {
    k8s-cp-1   = { ip = "10.0.55.131/24", target_node = "microserver55", memory = 4096, balloon = 4096 }
    k8s-cp-2   = { ip = "10.0.55.132/24", target_node = "microserver56", memory = 4096, balloon = 4096 }
    k8s-cp-3   = { ip = "10.0.55.133/24", target_node = "microserver57", memory = 4096, balloon = 4096 }
    k8s-node-1 = { ip = "10.0.55.141/24", target_node = "microserver55", memory = 4096, balloon = 4096 }
    k8s-node-2 = { ip = "10.0.55.142/24", target_node = "microserver56", memory = 4096, balloon = 4096 }
    k8s-node-3 = { ip = "10.0.55.143/24", target_node = "microserver57", memory = 4096, balloon = 4096 }
  }
}

module "kubernetes" {
  source = "git::git@github.com:videocursoscloud/terraform-module-proxmox.git"
  for_each          = local.kubernetes
  clone_source_name = "ubuntu-jammy"

  name        = each.key
  ip          = each.value.ip
  target_node = each.value.target_node
  memory      = each.value.memory
  balloon     = each.value.balloon
  size        = "20000M"

  gw = "10.0.55.54"

  ci_user         = "mijack"
  ci_nameserver   = "8.8.8.8"
  ci_searchdomain = "homelab.localdomain"
  ci_sshkeys      = var.ci_sshkeys
  cpu_cores       = 2
  cpu_sockets     = 2
  full_clone      = false
}
