## Configure the vSphere Provider
provider "vsphere" {
  vsphere_server       = var.vsphere_server
  user                 = var.vsphere_user
  password             = var.vsphere_password
  allow_unverified_ssl = true
}

## Build VM
data "vsphere_datacenter" "dc" {
  name = var.vsphere_dc
}

data "vsphere_datastore" "datastore" {
  name          = var.vsphere_datastore
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_compute_cluster" "compute_cluster" {
  name          = var.vsphere_cluster
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_network" "vnet" {
  name          = var.vsphere_network
  datacenter_id = data.vsphere_datacenter.dc.id
}

data "vsphere_virtual_machine" "centos-template" {
  name          = var.centos_template
  datacenter_id = data.vsphere_datacenter.dc.id
}

resource "vsphere_virtual_machine" "centos-vm" {
  name             = var.vm_name
  datastore_id     = data.vsphere_datastore.datastore.id
  resource_pool_id = data.vsphere_compute_cluster.compute_cluster.resource_pool_id

  num_cpus                  = 5
  memory                    = var.linux_hw_params["ram"]
  wait_for_guest_ip_timeout = 10
  guest_id                  = "centos8_64Guest"

  network_interface {
    network_id   = data.vsphere_network.vnet.id
    adapter_type = "vmxnet3"
  }

  disk {
    size             = var.linux_hw_params["disk"]
    label            = "${var.vm_name}-disk"
    eagerly_scrub    = false
    thin_provisioned = true
  }
  firmware = data.vsphere_virtual_machine.centos-template.firmware
  clone {
    template_uuid = data.vsphere_virtual_machine.centos-template.id
     
  }
}
