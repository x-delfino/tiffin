# General

variable "os_name" {
  type        = string
  description = "operating system name"
}

variable "os_type" {
  type        = string
  description = "operating system type (windows/linux/macos)"
  validation {
    condition     = contains(["windows", "linux", "macos"], var.os_type)
    error_message = "Operating system type must be windows, linux, or macos."
  }
}

variable "os_arch" {
  type        = string
  description = "operating system architecture (aarch64)"
  validation {
    condition     = contains(["aarch64"], var.os_arch)
    error_message = "Operating system architecture must be aarch64."
  }
}

variable "os_version" {
  type        = string
  description = "operating system version"
}

variable "cpu_count" {
  type    = number
  default = 2
}

variable "disk_size" {
  type    = string
}

variable "memory" {
  type    = string
}

variable "http_directory" {
  type    = string
}

variable "iso_url" {
  type    = string
}

variable "iso_checksum" {
  type    = string
}

variable "ssh_username" {
  type    = string
}

variable "ssh_password" {
  type    = string
}

variable "ssh_port" {
  type    = number
  default = 22
}

variable "ssh_timeout" {
  type    = string
  default = "1000s"
}

# Source

variable "boot_command" {
  type    = list(string)
  default     = null
}

variable "parallels_boot_wait" {
  type    = string
  default = "5s"
}

variable "parallels_guest_os_type" {
  type        = string
  default = null
}

# Build

variable "ansible_playbook_file" {
  type    = string
}

variable "ansible_galaxy_file" {
  type    = string
}

variable "ansible_ssh_extra_args" {
  type    = list(string)
  default = null
}

variable "ansible_extra_args" {
  type    = list(string)
  default = null
}

variable "build_dir" {
  type    = string
  default = "../builds"
}

variable "vagrant_cloud_box_tag" {
  type    = string
}

variable "vagrant_cloud_version" {
  type    = string
}
