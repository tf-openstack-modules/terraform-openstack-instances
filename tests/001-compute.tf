module "test_instance_simple" {
  source = "../"

	name = "test_instance_simple"
	flavor_name = local.flavor_name
	image_id = local.image_id
	key_pair_name = local.key_pair_name
	ports = [
		{
			name = "port_name",
			network_id = "471e10fa-c13c-455c-a78f-f6cb48cd735f",
			subnet_id = "3740a585-e3d2-425a-9fc5-bd6b479fd01e",
		},
		{
			name = "port_name_1",
			network_id = "471e10fa-c13c-455c-a78f-f6cb48cd735f",
			subnet_id = "3740a585-e3d2-425a-9fc5-bd6b479fd01e",
		}
	]
}

module "test_instance_with_public_ip" {
  source = "../"

	name = "test_instance_ports"
	flavor_name = local.flavor_name
	image_id = local.image_id
	key_pair_name = local.key_pair_name
	public_ip_network = local.public_ip_network
	ports = [
		{
			name = "port_name",
			network_id = "471e10fa-c13c-455c-a78f-f6cb48cd735f",
			subnet_id = "3740a585-e3d2-425a-9fc5-bd6b479fd01e",
		}
	]
}

module "test_instance_server_groups" {
  source = "../"

	name = "test_instance_server_groups"
	flavor_name = local.flavor_name
	image_id = local.image_id
	key_pair_name = local.key_pair_name
	public_ip_network = local.public_ip_network
	server_groups = ["wwww"]
	ports = [
		{
			name = "port_name",
			network_id = "471e10fa-c13c-455c-a78f-f6cb48cd735f",
			subnet_id = "3740a585-e3d2-425a-9fc5-bd6b479fd01e",
		}
	]
}