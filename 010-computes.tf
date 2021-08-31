#
# Create instance
#
resource "openstack_compute_instance_v2" "instance" {
  name        = var.name
  flavor_name = var.flavor_name

  block_device {
    uuid                  = var.image_id
    source_type           = "image"
    volume_size           = var.block_device_volume_size
    boot_index            = 0
    destination_type      = "volume"
    delete_on_termination = var.block_device_delete_on_termination
  }

  key_pair = var.key_pair_name

  dynamic "scheduler_hints" {
    for_each = var.server_groups
    content {
      group = scheduler_hints.value
    }
  }

  dynamic "network" {
    for_each = openstack_networking_port_v2.port

    content {
      port = network.value["id"]
    }
  }
}

# Create network port

resource "openstack_networking_port_v2" "port" {
  count = length(var.ports)

  name = var.ports[count.index].name
  network_id = var.ports[count.index].network_id
  admin_state_up = var.ports[count.index].admin_state_up == null ? true : var.ports[count.index].admin_state_up
  security_group_ids = var.ports[count.index].security_group_ids == null ? [] : var.ports[count.index].security_group_ids
  fixed_ip {
    subnet_id = var.ports[count.index].subnet_id
    ip_address = var.ports[count.index].ip_address == null ? null : var.ports[count.index].ip_address
  }
}

# Create floating ip
resource "openstack_networking_floatingip_v2" "ip" {
  count = var.is_public ? 1 : 0

  pool = var.public_ip_network
}

# Attach floating ip to instance
resource "openstack_compute_floatingip_associate_v2" "ipa" {
  count = var.is_public ? 1: 0

  floating_ip = openstack_networking_floatingip_v2.ip[count.index].address
  instance_id = openstack_compute_instance_v2.instance.id
}