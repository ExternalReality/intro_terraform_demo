# Key Outputs

# Linux Server IP
output "vm_ip" {
  value = vsphere_virtual_machine.centos-vm.default_ip_address
}
