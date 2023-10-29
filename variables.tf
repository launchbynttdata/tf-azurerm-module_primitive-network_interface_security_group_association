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

variable "network_interface_id" {
  type        = string
  description = "(Required) The ID of the Network Interface. Changing this forces a new resource to be created."
}

variable "network_security_group_id" {
  type        = string
  description = "(Required) The ID of the Network Security Group which should be attached to the Network Interface. Changing this forces a new resource to be created."
}
