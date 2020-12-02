# Terraform Openstack Instances

_This project aims to create a module to deploy instance(s) on openstack provider._

![Release](https://github.com/tf-openstack-modules/terraform-openstack-instances/workflows/Release/badge.svg)
![GitHub tag (latest by date)](https://img.shields.io/github/v/tag/tf-openstack-modules/terraform-openstack-instances)

## Where to find module documentations

You can find differents documentations versionned by terraform registry [here](https://registry.terraform.io/modules/tf-openstack-modules/instances/openstack/latest).

## Usage examples

```terraform
module "test_instance_simple" {
	source  = "tf-openstack-modules/instances/openstack"
	version = "<version>"
 
	name = "instance"
	flavor_name = "m1.xs" 
	image_id = "<image_id>"
	key_pair_name = "my_key_pair"
	public_ip_network = "floating"

	ports = [
		{
			name = "db_port",
			network_id = "db_network_id",
			subnet_id = "db_subnet_id",
		},
		{
			name = "web_port",
			network_id = "web_network_id",
			subnet_id = "web_subnet_id",
		}
	]
	server_groups = ["web"]
}
```