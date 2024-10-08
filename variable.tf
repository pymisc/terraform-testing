variable "region_name" {
  default     = "us-west2"
  description = "Region name"
}
variable "zone_name" {
  default     = "us-west2-a"
  description = "Instance name to create"
}
variable "instance_name" {
  default     = "gcpserver01"
  description = "Instance name to create"
}
variable "machine_type" {
  default     = "custom-2-8192"
  description = "Machine Type to create, Custome or GCP provided"
}
variable "boot_disk_image" {
  default     = "cloud-rhel8-v02"
  description = "Boot disk image to create instance"
}
variable "boot_disk_image_size" {
  default     = "100"
  description = "Boot disk image to create instance"
}
variable "instance_network" {
  default     = "it-network"
  description = "network name"
}
variable "instance_subnetwork" {
  default     = "it-network-87"
  description = "subnetwork name"
}
variable "network_tags" {
  default     = ["abcd1","abcd2","abcd3"]
  description = "Network tags for the instance"
}
variable "disks_count" {
  default     = 1
  description = "disks count"
}
variable "disk_size" {
  type	      = "list"
   default     = [300]
  description = "Size of additiona disks to be created"
}
variable "instance_internal_ip" {
  default     = "internalip"
  description = "Instance Internal IP"
}
