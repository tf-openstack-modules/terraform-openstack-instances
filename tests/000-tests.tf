locals {
	flavor_name = "m1.xs" 
	image_id = "aa3496d7-5f0e-4ff1-a068-5af50fc5e963"
	key_pair_name = "ssh_key_name"
	public_ip_network = "floating"
}

provider "openstack" {
  use_octavia = true
}