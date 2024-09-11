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

locals {
  resource_group_name         = module.resource_names["resource_group"].minimal_random_suffix
  nic_name                    = module.resource_names["nic"].minimal_random_suffix
  virtual_network_name        = module.resource_names["virtual_network"].minimal_random_suffix
  public_ip_name              = module.resource_names["public_ip"].minimal_random_suffix
  network_security_group_name = module.resource_names["network_security_group"].minimal_random_suffix

  subnet_id            = lookup(module.virtual_network.vnet_subnets_name_id, "subnet1", null)
  public_ip_address_id = module.public_ip.id
  ip_configuration     = [for config in var.ip_configuration : merge(config, { subnet_id = local.subnet_id, public_ip_address_id = local.public_ip_address_id })]
}
