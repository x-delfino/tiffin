locals {
  build_timestamp = "${formatdate("YYYY-MM-DD", timestamp())}"
  vm_name         = regex_replace("${local.build_timestamp}${var.os_name}${var.os_version}", "[^a-zA-Z0-9]*", "")
  parallels_tools_flavor = join("", [lookup({
      linux   = "lin",
      windows = "win",
      macos   = "mac"
  }, var.os_type, "other"), lookup({
      aarch64 = "-arm" 
  }, var.os_arch, "")])
  shutdown_command = lookup({
      linux = "echo 'vagrant' | sudo -S /sbin/shutdown -hP now",
      macos = "sudo shutdown -h now"
  }, var.os_type, "")
  build_sources = lookup({
      linux   = ["source.parallels-iso.this"],
      windows   = ["source.parallels-iso.this"],
      macos   = ["source.parallels-ipsw.this"],
  }, var.os_type, [])
}
