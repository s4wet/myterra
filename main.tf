resource "proxmox_vm_qemu" "engine5" {
  name              = "test"
  target_node       = "pve-uat2"
  vmid              = 2006041
  clone             = "ubuntu-1804-cloudinit"
  full_clone        = true
  memory            = 8192
  cores             = 2
  sockets           = 2

  disk {
    id              = 0
    size            = 100
    type            = "scsi"
    storage         = "external"
    storage_type    = "nfs"
    iothread        = false
  }

  network {
    id              = 0
    model           = "virtio"
    bridge          = "vmbr0"
  }

  # Cloud Init Settings
  ipconfig0         = "ip=192.168.60.96/24,gw=192.168.60.254"
  ciuser            = "root"
  cipassword        = "password"
  
#   sshkeys = <<EOF
#   ${var.ssh_key}
#   EOF

}