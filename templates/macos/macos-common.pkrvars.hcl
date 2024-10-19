os_name = "macos"
os_type = "macos"
cpu_count = 4
disk_size = 65536
memory = 4096
boot_command = [
    "<wait4m><enter><wait2s><enter><wait20s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait5s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><tab><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><tab><leftShiftOff><spacebar><wait1s>",
    "<tab><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<tab><spacebar><wait1s>",
    "vagrant", // set username
    "<tab><tab>vagrant", // set password
    "<tab>vagrant", // repeat password
    "<tab><tab><tab><spacebar><wait15s>", // create user
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>", // set timezone
    "<tab><spacebar>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><tab><tab><leftShiftOff><spacebar><wait1s>",
    "<tab><spacebar>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftShiftOn><tab><leftShiftOff><spacebar><wait1s>",
    "<leftSuperOn><leftShiftOn>g<leftSuperOff><leftShiftOff>", // launch 'go to' dialog
    "/System/Applications/System Settings", // navigate to system settings in finder
    "<leftSuperOn>o<leftSuperOff><wait1s>", // open system settings
    "<leftShiftOn><tab><leftShiftOff>", // navigate to search
    ""
]
http_directory  = "./http/linux/debian"
parallels_guest_os_type = ""
ssh_username = "vagrant"
ssh_password = "vagrant"
ansible_playbook_file = "../playbooks/vagrant_parallels.yml"
ansible_galaxy_file = "../playbooks/requirements.yml"
ansible_extra_args = [ "--scp-extra-args", "'-O'" ]
vagrant_box_build_dir = "../builds"
