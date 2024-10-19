os_name = "debian"
os_type = "linux"
cpu_count = 2
disk_size = 65536
memory = 1024
boot_command=[
    "e<wait>",
    "<down><down><down>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right><right><right><right><right><right><right>",
    "<right><right><right><right>",
    "install <wait> ",
    "preseed/url=http://{{ .HTTPIP }}:{{ .HTTPPort }}/preseed.cfg ",
    "auto ",
    "locale=en_US.UTF-8 ",
    "keyboard-configuration/xkb-keymap=us ",
    "netcfg/get_hostname={{ .Name }} ",
    "netcfg/get_domain= ",
    "<f10>"
]
http_directory  = "./http/linux/debian"
parallels_guest_os_type = "debian"
ssh_username = "vagrant"
ssh_password = "vagrant"
ansible_playbook_file = "../playbooks/vagrant_parallels.yml"
ansible_galaxy_file = "../playbooks/requirements.yml"
ansible_extra_args = [ "--scp-extra-args", "'-O'" ]
vagrant_box_build_dir = "../builds"
