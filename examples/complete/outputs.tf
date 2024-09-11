// Licensed under the Apache License, Version 2.0 (the "License");
// you may not use this file except in compliance with the License.
// You may obtain a copy of the License at
//
//     http://www.apache.org/licenses/LICENSE-2.0
//
// Unless required by applicable law or agreed to in writing, software
// distributed under the License is distributed on an "AS IS" BASIS,
// WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
// See the License for the specific language governing permissions and
// limitations under the License.

output "nic_id" {
  value       = module.nic.id
  description = "The ID of the Network Interface."
}

output "nic_name" {
  value       = module.nic.name
  description = "The name of the Network Interface."
}

output "resource_group_name" {
  value       = module.resource_group.name
  description = "The name of the Resource Group in which the Network Interface exists."
}

output "applied_dns_servers" {
  value       = module.nic.applied_dns_servers
  description = "If the Virtual Machine using this Network Interface is part of an Availability Set, then this list will have the union of all DNS servers from all Network Interfaces that are part of the Availability Set."
}

output "internal_domain_name_suffix" {
  value       = module.nic.internal_domain_name_suffix
  description = "Even if internal_dns_name_label is not specified, a DNS entry is created for the primary NIC of the VM. This DNS name can be constructed by concatenating the VM name with the value of internal_domain_name_suffix."
}

output "mac_address" {
  value       = module.nic.mac_address
  description = "The Media Access Control (MAC) Address of the Network Interface."
}

output "private_ip_address" {
  value       = module.nic.private_ip_address
  description = "The first private IP address of the network interface."
}

output "private_ip_addresses" {
  value       = module.nic.private_ip_addresses
  description = "The private IP addresses of the network interface."
}

output "virtual_machine_id" {
  value       = module.nic.virtual_machine_id
  description = "The ID of the Virtual Machine which this Network Interface is connected to."
}

output "network_security_group_id" {
  value       = module.network_security_group.network_security_group_id
  description = "The NSG ID."
}

output "id" {
  value       = module.nsg_association.id
  description = "The (Terraform specific) ID of the Association between the Network Interface and the Network Interface."
}
