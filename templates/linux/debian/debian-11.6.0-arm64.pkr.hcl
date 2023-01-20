###############
##  Plugins  ##
###############

packer {
  required_plugins {
    parallels = {
      version = ">= 1.0.1"
      source  = "github.com/hashicorp/parallels"
    }
  }
}

###############
## Variables ##
###############

variable "version" {
  type    = string
  default = "0.1.0"
}

variable "playbook" {
  type    = string
  default = "../../../playbooks/vagrant_parallels.yml"
}

variable "galaxy_file" {
  type    = string
  default = "../../../playbooks/requirements.yml"
}

variable "box_tag" {
  type    = string
  default = "delfino/debian-11.6-arm64"
}

variable "box_basename" {
  type    = string
  default = "debian-11.6.0-arm64"
}

variable "hostname" {
  type    = string
  default = "debian-11-6"
}

variable "build_directory" {
  type    = string
  default = "../../../builds"
}

variable "cpus" {
  type    = string
  default = "2"
}

variable "disk_size" {
  type    = string
  default = "65536"
}

variable "iso_checksum" {
  type    = string
  default = "sha256:522706a58317915aceb5eef9b777d04ab573982b36670705e2e6d83dd4669e52"
}

variable "iso_name" {
  type    = string
  default = "debian-11.6.0-arm64-netinst.iso"
}

variable "memory" {
  type    = string
  default = "1024"
}

variable "mirror" {
  type    = string
  default = "https://cdimage.debian.org/debian-cd"
}

variable "mirror_directory" {
  type    = string
  default = "11.6.0/arm64/iso-cd"
}

variable "preseed_path" {
  type    = string
  default = "debian-preseed.cfg"
}

variable "vm_name" {
  type    = string
  default = "debian-11.6.0-arm64"
}

locals {
  build_timestamp = "${formatdate("YYYY-MM-DD", timestamp())}"
  http_directory  = "${path.root}/../http"
}


###############
##  Source   ##
###############

source "parallels-iso" "debian-install" {
  boot_command = [
    "e<wait>",
    "<down><down><down>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right>",
    "install <wait>",
    " preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/${var.preseed_path} ",
    "auto ",
    "locale=en_US.UTF-8 ",
    "keyboard-configuration/xkb-keymap=us ",
    "netcfg/get_hostname=${var.hostname} ",
    "netcfg/get_domain= ",
    "<f10>"
  ]
  boot_wait              = "5s"
  cpus                   = "${var.cpus}"
  disk_size              = "${var.disk_size}"
  guest_os_type          = "debian"
  http_directory         = "${local.http_directory}"
  iso_checksum           = "${var.iso_checksum}"
  iso_url                = "${var.mirror}/${var.mirror_directory}/${var.iso_name}"
  memory                 = "${var.memory}"
  output_directory       = "${var.build_directory}/packer-${var.vm_name}-parallels"
  parallels_tools_flavor = "lin-arm"
  prlctl_version_file    = ".prlctl_version"
  shutdown_command       = "echo 'vagrant' | sudo -S /sbin/shutdown -hP now"
  ssh_password           = "vagrant"
  ssh_port               = 22
  ssh_timeout            = "10000s"
  ssh_username           = "vagrant"
  vm_name                = "${var.vm_name}"
}

###############
##   Build   ##
###############

build {
  sources = ["source.parallels-iso.debian-install"]

  provisioner "ansible" {
    playbook_file  = "${var.playbook}" 
    galaxy_file    = "${var.galaxy_file}"
    user           = "vagrant"
  }

  post-processors {
    post-processor "vagrant" {
      output       = "${var.build_directory}/${var.box_basename}.{{ .Provider }}.box"
    }

    post-processor "vagrant-cloud" {
      box_tag      = "${var.box_tag}"
      version      = "${var.version}"
    }
  }
}
