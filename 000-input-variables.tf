variable "servergroup_id" {
  type = string
}

variable "key_pair_name" {
  type = string
}

variable "image" {
  type = object({ id=string, name=string })
}

variable "instance" {
  type = object({ name=string, flavor_name=string, port_name=string})
}

variable "security_group_ids" {
  type = list(string)
}

variable "public_ip_network" {
  type = string
}

variable "network_id" {
  type = string
}

variable "subnet_id" {
  type = string
}
