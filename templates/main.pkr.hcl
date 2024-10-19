packer {
  required_plugins {
    ansible = {
      version = "~> 1.1.2"
      source = "github.com/hashicorp/ansible"
    }
    parallels = {
      version = "~> 1.1.0"
      source  = "github.com/Parallels/parallels"
    }
    vagrant = {
      version = "~> 1.1.0"
      source = "github.com/hashicorp/vagrant"
    }
  }
}

