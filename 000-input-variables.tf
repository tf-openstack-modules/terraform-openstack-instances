variable "key_pair_name" {
  type = string
  description = <<EOF
The name of the ssh key referenced in openstack
EOF
}

variable "image_id" {
  type = string
  description = <<EOF
The image's id referenced in openstack
EOF
}

variable "name" {
  type = string
  description = <<EOF
Instance's name
EOF
}

variable "flavor_name" {
  type = string
  description = <<EOF
Instance's flavor name referenced in openstack
EOF
}

variable "public_ip_network" {
  type = string
  description = <<EOF
The name of the network who give floating IPs
EOF
  default = null
}

variable "ports" {
  type = list(object({
    name = string
    network_id = string
    subnet_id = string
    admin_state_up = optional(bool)
    security_group_ids = optional(list(string))
    ip_address = optional(string)
  }))
  description = <<EOF
The ports list, at least 1 port is required
EOF
}

variable "block_device_volume_size" {
  type = number
  description = <<EOF
The volume size of block device
EOF
  default = 20
}

variable "block_device_delete_on_termination" {
  type = bool
  description = <<EOF
Delete block device when instance is shut down
EOF
  default = true
}

variable "server_groups" {
  type = list(string)
  description = <<EOF
List of server group id
EOF
  default = []
}