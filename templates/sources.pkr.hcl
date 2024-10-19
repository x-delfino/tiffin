source "parallels-iso" "this" {
  vm_name                = local.vm_name
  guest_os_type          = var.parallels_guest_os_type
  parallels_tools_flavor = local.parallels_tools_flavor

  boot_command           = var.boot_command
  boot_wait              = var.parallels_boot_wait
  shutdown_command       = local.shutdown_command

  iso_checksum           = var.iso_checksum
  iso_url                = var.iso_url

  http_directory         = var.http_directory
  output_directory       = "${var.build_dir}/packer-${local.vm_name}-parallels"

  cpus                   = var.cpu_count
  disk_size              = var.disk_size
  memory                 = var.memory

  ssh_username           = var.ssh_username
  ssh_password           = var.ssh_password
  ssh_port               = var.ssh_port
  ssh_timeout            = var.ssh_timeout
}

source "parallels-ipsw" "this" {
  vm_name              = local.vm_name

  boot_command         = var.boot_command
  boot_wait            = var.parallels_boot_wait
  shutdown_command     = local.shutdown_command

  ipsw_url             = var.iso_url
  ipsw_checksum        = var.iso_checksum

  cpus                 = var.cpu_count
  memory               = var.memory
  disk_size              = var.disk_size

  ssh_username         = var.ssh_password
  ssh_password         = var.ssh_username
}
