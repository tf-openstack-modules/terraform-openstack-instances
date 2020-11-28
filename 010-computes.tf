#
# Create instance
#
resource "openstack_compute_instance_v2" "instance" {
  name        = var.instance.name
  flavor_name = var.instance.flavor_name

  block_device {
    uuid                  = var.image.id
    source_type           = "image"
    volume_size           = 20
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = true
  }

  key_pair = var.key_pair_name

  scheduler_hints {
    group = var.servergroup_id
  }

  network {
    port = openstack_networking_port_v2.port.id
  }
}

# Create network port
resource "openstack_networking_port_v2" "port" {
  name = var.instance.port_name
  network_id     = var.network_id
  admin_state_up = true
  security_group_ids = var.security_group_ids
  fixed_ip {
    subnet_id = var.subnet_id
  }
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "ip" {
  pool = var.public_ip_network
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "master" {
  floating_ip = openstack_networking_floatingip_v2.ip.address
  instance_id = openstack_compute_instance_v2.instance.id
}
