build {
  sources = local.build_sources

  provisioner "ansible" {
    playbook_file          = var.ansible_playbook_file
    galaxy_file            = var.ansible_galaxy_file
    ansible_ssh_extra_args = var.ansible_ssh_extra_args
    extra_arguments        = var.ansible_extra_args
    user                   = var.ssh_username
  }

  post-processors {
    post-processor "vagrant" {
      output       = "${var.build_dir}/${local.vm_name}.{{ .Provider }}.box"
    }

    post-processor "vagrant-cloud" {
      box_tag      = "${var.vagrant_cloud_box_tag}"
      version      = "${var.vagrant_cloud_version}"
    }
  }
}
