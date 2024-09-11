# nic

<!-- BEGINNING OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
## Requirements

| Name | Version |
|------|---------|
| <a name="requirement_terraform"></a> [terraform](#requirement\_terraform) | ~> 1.0 |
| <a name="requirement_azurerm"></a> [azurerm](#requirement\_azurerm) | ~> 3.77 |

## Providers

No providers.

## Modules

| Name | Source | Version |
|------|--------|---------|
| <a name="module_nsg_association"></a> [nsg\_association](#module\_nsg\_association) | ../.. | n/a |
| <a name="module_nic"></a> [nic](#module\_nic) | terraform.registry.launch.nttdata.com/module_primitive/network_interface/azurerm | ~> 1.0 |
| <a name="module_resource_group"></a> [resource\_group](#module\_resource\_group) | terraform.registry.launch.nttdata.com/module_primitive/resource_group/azurerm | ~> 1.0 |
| <a name="module_resource_names"></a> [resource\_names](#module\_resource\_names) | terraform.registry.launch.nttdata.com/module_library/resource_name/launch | ~> 1.0 |
| <a name="module_virtual_network"></a> [virtual\_network](#module\_virtual\_network) | terraform.registry.launch.nttdata.com/module_primitive/virtual_network/azurerm | ~> 1.0 |
| <a name="module_public_ip"></a> [public\_ip](#module\_public\_ip) | terraform.registry.launch.nttdata.com/module_primitive/public_ip/azurerm | ~> 1.0 |
| <a name="module_network_security_group"></a> [network\_security\_group](#module\_network\_security\_group) | terraform.registry.launch.nttdata.com/module_primitive/network_security_group/azurerm | ~> 1.0 |

## Resources

No resources.

## Inputs

| Name | Description | Type | Default | Required |
|------|-------------|------|---------|:--------:|
| <a name="input_ip_configuration"></a> [ip\_configuration](#input\_ip\_configuration) | List containining the IP Configuration for the Network Interface. | <pre>list(object({<br>    name                                               = string<br>    gateway_load_balancer_frontend_ip_configuration_id = optional(string)<br>    private_ip_address_version                         = optional(string)<br>    private_ip_address_allocation                      = string<br>    primary                                            = optional(bool)<br>    private_ip_address                                 = optional(string)<br>  }))</pre> | n/a | yes |
| <a name="input_location"></a> [location](#input\_location) | (Required) Specifies the supported Azure location where the resource exists. Changing this forces a new resource to be created. | `string` | n/a | yes |
| <a name="input_dns_servers"></a> [dns\_servers](#input\_dns\_servers) | (Optional) A list of DNS servers IP addresses to associate with the NIC. Use 'AzureProvidedDNS' to switch to Azure provided DNS resolution. | `list(string)` | `[]` | no |
| <a name="input_edge_zone"></a> [edge\_zone](#input\_edge\_zone) | (Optional) Specifies the Edge Zone where the resource should be created. Changing this forces a new resource to be created. | `string` | `null` | no |
| <a name="input_enable_ip_forwarding"></a> [enable\_ip\_forwarding](#input\_enable\_ip\_forwarding) | (Optional) Should IP forwarding be enabled on this NIC? Defaults to false. | `bool` | `false` | no |
| <a name="input_enable_accelerated_networking"></a> [enable\_accelerated\_networking](#input\_enable\_accelerated\_networking) | (Optional) Should accelerated networking be enabled on this NIC? Defaults to false. | `bool` | `false` | no |
| <a name="input_internal_dns_name_label"></a> [internal\_dns\_name\_label](#input\_internal\_dns\_name\_label) | (Optional) The (relative) DNS Name used for internal communications between Virtual Machines in the same Virtual Network. | `string` | `null` | no |
| <a name="input_tags"></a> [tags](#input\_tags) | (Optional) A mapping of tags to assign to the resource. | `map(string)` | `{}` | no |
| <a name="input_resource_names_map"></a> [resource\_names\_map](#input\_resource\_names\_map) | A map of key to resource\_name that will be used by tf-launch-module\_library-resource\_name to generate resource names | <pre>map(object({<br>    name       = string<br>    max_length = optional(number, 60)<br>  }))</pre> | `{}` | no |
| <a name="input_instance_env"></a> [instance\_env](#input\_instance\_env) | Number that represents the instance of the environment. | `number` | `0` | no |
| <a name="input_instance_resource"></a> [instance\_resource](#input\_instance\_resource) | Number that represents the instance of the resource. | `number` | `0` | no |
| <a name="input_logical_product_family"></a> [logical\_product\_family](#input\_logical\_product\_family) | (Required) Name of the product family for which the resource is created.<br>    Example: org\_name, department\_name. | `string` | `"launch"` | no |
| <a name="input_logical_product_service"></a> [logical\_product\_service](#input\_logical\_product\_service) | (Required) Name of the product service for which the resource is created.<br>    For example, backend, frontend, middleware etc. | `string` | `"network"` | no |
| <a name="input_class_env"></a> [class\_env](#input\_class\_env) | (Required) Environment where resource is going to be deployed. For example. dev, qa, uat | `string` | `"dev"` | no |
| <a name="input_address_space"></a> [address\_space](#input\_address\_space) | The address space that is used by the virtual network. | `list(string)` | <pre>[<br>  "10.0.0.0/16"<br>]</pre> | no |
| <a name="input_subnet_names"></a> [subnet\_names](#input\_subnet\_names) | A list of public subnets inside the vNet. | `list(string)` | <pre>[<br>  "subnet1",<br>  "subnet2",<br>  "subnet3"<br>]</pre> | no |
| <a name="input_subnet_prefixes"></a> [subnet\_prefixes](#input\_subnet\_prefixes) | The address prefix to use for the subnet. | `list(string)` | <pre>[<br>  "10.0.1.0/24",<br>  "10.0.2.0/24",<br>  "10.0.3.0/24"<br>]</pre> | no |
| <a name="input_use_for_each"></a> [use\_for\_each](#input\_use\_for\_each) | Use `for_each` instead of `count` to create multiple resource instances. | `bool` | n/a | yes |
| <a name="input_security_rules"></a> [security\_rules](#input\_security\_rules) | (Optional) A list of security rules associated with the network security group. | <pre>list(object({<br>    name                                       = string<br>    protocol                                   = string<br>    access                                     = string<br>    priority                                   = number<br>    direction                                  = string<br>    description                                = optional(string)<br>    source_port_range                          = optional(string)<br>    source_port_ranges                         = optional(list(string))<br>    destination_port_range                     = optional(string)<br>    destination_port_ranges                    = optional(list(string))<br>    source_address_prefix                      = optional(string)<br>    source_address_prefixes                    = optional(list(string))<br>    source_application_security_group_ids      = optional(list(string))<br>    destination_address_prefix                 = optional(string)<br>    destination_address_prefixes               = optional(list(string))<br>    destination_application_security_group_ids = optional(list(string))<br>  }))</pre> | `null` | no |

## Outputs

| Name | Description |
|------|-------------|
| <a name="output_nic_id"></a> [nic\_id](#output\_nic\_id) | The ID of the Network Interface. |
| <a name="output_nic_name"></a> [nic\_name](#output\_nic\_name) | The name of the Network Interface. |
| <a name="output_resource_group_name"></a> [resource\_group\_name](#output\_resource\_group\_name) | The name of the Resource Group in which the Network Interface exists. |
| <a name="output_applied_dns_servers"></a> [applied\_dns\_servers](#output\_applied\_dns\_servers) | If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set. |
| <a name="output_internal_domain_name_suffix"></a> [internal\_domain\_name\_suffix](#output\_internal\_domain\_name\_suffix) | Even if internal\_dns\_name\_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal\_domain\_name\_suffix. |
| <a name="output_mac_address"></a> [mac\_address](#output\_mac\_address) | The Media Access Control (MAC) Address of the Network Interface. |
| <a name="output_private_ip_address"></a> [private\_ip\_address](#output\_private\_ip\_address) | The first private IP address of the network interface. |
| <a name="output_private_ip_addresses"></a> [private\_ip\_addresses](#output\_private\_ip\_addresses) | The private IP addresses of the network interface. |
| <a name="output_virtual_machine_id"></a> [virtual\_machine\_id](#output\_virtual\_machine\_id) | The ID of the Virtual Machine which this Network Interface is connected to. |
| <a name="output_network_security_group_id"></a> [network\_security\_group\_id](#output\_network\_security\_group\_id) | The NSG ID. |
| <a name="output_id"></a> [id](#output\_id) | The (Terraform specific) ID of the Association between the Network Interface and the Network Interface. |
<!-- END OF PRE-COMMIT-TERRAFORM DOCS HOOK -->
