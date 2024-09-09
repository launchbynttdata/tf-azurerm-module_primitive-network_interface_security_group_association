location = "eastus"
ip_configuration = [
  {
    name                          = "ipconfig1"
    private_ip_address_allocation = "Dynamic"
    primary                       = true
  }
]
enable_accelerated_networking = false
tags = {
  environment = "production"
}
resource_names_map = {
  resource_group = {
    name       = "rg"
    max_length = 80
  }
  public_ip = {
    name       = "pip"
    max_length = 80
  }
  nic = {
    name       = "nic"
    max_length = 80
  }
  virtual_network = {
    name       = "vnet"
    max_length = 80
  }
  network_security_group = {
    name       = "nsg"
    max_length = 80
  }
}
address_space   = ["10.0.0.0/16"]
subnet_names    = ["subnet1"]
subnet_prefixes = ["10.0.1.0/24"]
use_for_each    = true
dns_servers     = []

security_rules = [
  {
    name                       = "test123-ib"
    description                = "test123-ib"
    protocol                   = "Tcp"
    source_port_range          = 80
    destination_port_range     = 80
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 100
    direction                  = "Inbound"
  },
  {
    name                       = "test123-ob"
    description                = "test123-ob"
    protocol                   = "Tcp"
    source_port_range          = 80
    destination_port_range     = 80
    source_address_prefix      = "*"
    destination_address_prefix = "*"
    access                     = "Allow"
    priority                   = 100
    direction                  = "Outbound"
  }
]
