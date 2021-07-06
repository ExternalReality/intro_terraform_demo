variable "vsphere_server" {
  description = "Vcenter hostname or ip"
  default     = "vc.lab.local"
}

variable "vsphere_user" {
  description = "vcenter user name"
}

variable "vsphere_password" {
  description = "vcenter user's password"
}

variable "root_password" {
  description = "Linux root user's password"
}

variable "vsphere_dc" {
  description = "Vspehere datacenter name"
  default     = "WWT"
}

variable "vsphere_cluster" {
  description = "Vsphere cluster name"
  default     = "ATC"
}

variable "vsphere_datastore" {
  description = "vsphere datastore"
  default     = "esx01-local"
}

variable "centos_template" {
  description = "centos vcenter template name"
  default     = "Centos8_template"
}

variable "win2019_template" {
  description = "win2019 vcenter template name"
  default     = "Win2019-Packer-Template"
}

variable "vm_name" {
  description = "vm name"
}

variable "vsphere_network" {
  description = "vm network"
  default     = "Management"
}

variable "linux_hw_params" {
  description = "linux hw params"
  type        = map
}
