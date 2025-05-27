module "testvm" {
  source = "git::git@github.com:videocursoscloud/terraform-module-proxmox.git"
  clone_source_name = "ubuntu-jammy"

  name        = "testvm"
  ip          = "10.0.55.111/24"
  target_node = "microserver57"
  memory      = 1024
  balloon     = 1024
  size        = "20000M"

  gw = "10.0.55.54"

  ci_user         = "mijack"
  ci_nameserver   = "8.8.8.8"
  ci_searchdomain = "homelab.localdomain"
  ci_sshkeys = var.ci_sshkeys
  cpu_cores = 2
  cpu_sockets = 2
}
