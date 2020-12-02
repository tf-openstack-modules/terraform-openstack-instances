module "test_instance_simple" {
  source = "../"

	name = ""
	flavor_name = "m1.xs" 
	image_id = "aa3496d7-5f0e-4ff1-a068-5af50fc5e963"
	key_pair_name = "le nom que je veux lui donner"
	public_ip_network = "floating"
}

module "test_instance_ports" {
  source = "../"

	name = "super_name"
	flavor_name = "m1.xs" 
	image_id = "aa3496d7-5f0e-4ff1-a068-5af50fc5e963"
	key_pair_name = "le nom que je veux lui donner"
	public_ip_network = "floating"
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

module "test_instance_server_groups" {
  source = "../"

	name = "super_name"
	flavor_name = "m1.xs" 
	image_id = "aa3496d7-5f0e-4ff1-a068-5af50fc5e963"
	key_pair_name = "le nom que je veux lui donner"
	public_ip_network = "floating"
	server_groups = ["192.168.0.1", "192.168.0.2", "192.168.0.3"]
}