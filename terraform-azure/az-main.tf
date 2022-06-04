terraform {
  required_providers {
    azurerm = {
      source  = "hashicorp/azurerm"
      version = "=3.0.0"
    }
  }
}


provider "azurerm" {
  features {}
}
resource "azurerm_resource_group" "rg-terraform-1" {
  name     = "rg-terraform-1"
  location = "West US"
}
resource "azurerm_virtual_network" "terraform-vnet-1" {
  name                = "terraform-vnet-1"
  resource_group_name = azurerm_resource_group.rg-terraform-1.name
  location            = azurerm_resource_group.rg-terraform-1.location
  address_space       = ["10.0.0.0/16"]
  depends_on = [
    azurerm_resource_group.rg-terraform-1
  ]
}
resource "azurerm_subnet" "internal" {
  name                 = "internal"
  resource_group_name  = azurerm_resource_group.rg-terraform-1.name
  virtual_network_name = azurerm_virtual_network.terraform-vnet-1.name
  address_prefixes     = ["10.0.100.0/24"]
}

resource "azurerm_network_interface" "webserver-nic" {
  name                = "webserver-nic"
  resource_group_name = azurerm_resource_group.rg-terraform-1.name
  location            = azurerm_resource_group.rg-terraform-1.location

  ip_configuration {
    name                          = "internal"
    private_ip_address_allocation = "Dynamic"
  }
}
resource "azurerm_linux_virtual_machine_scale_set" "webserver" {
  name = "webserver"
  computer_name_prefix = "web-linux"
  resource_group_name = azurerm_resource_group.rg-terraform-1.name
  location            = azurerm_resource_group.rg-terraform-1.location
  sku                 = "Standard_F2"
  instances           = 2
  admin_username      = "adminuser"

  admin_ssh_key {
    username   = "adminuser"
    public_key = file("azchallengekey.pub")
  }

  os_disk {
    caching              = "ReadWrite"
    storage_account_type = "Standard_LRS"
  }

  source_image_reference {
    publisher = "Canonical"
    offer     = "UbuntuServer"
    sku       = "16.04-LTS"
    version   = "latest"
  }
    network_interface {
    name    = "example"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id
    }
  }
}

resource "azurerm_windows_virtual_machine_scale_set" "webserver" {
  name = "webserver"
  computer_name_prefix = "web-win"
  resource_group_name = azurerm_resource_group.rg-terraform-1.name
  location            = azurerm_resource_group.rg-terraform-1.location
  sku                 = "Standard_F2"
  instances           = 2
  admin_password      = "P@55w0rd1234!"
  admin_username      = "adminuser"

  source_image_reference {
    publisher = "MicrosoftWindowsServer"
    offer     = "WindowsServer"
    sku       = "2016-Datacenter-Server-Core"
    version   = "latest"
  }

  os_disk {
    storage_account_type = "Standard_LRS"
    caching              = "ReadWrite"
  }

  network_interface {
    name    = "nic-1"
    primary = true

    ip_configuration {
      name      = "internal"
      primary   = true
      subnet_id = azurerm_subnet.internal.id
    }
  }
}