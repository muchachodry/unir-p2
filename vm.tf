# Creamos una máquina virtual
# https://registry.terraform.io/providers/hashicorp/azurerm/latest/docs/resources/linux_virtual_machine

resource "azurerm_linux_virtual_machine" "myVM1" {
    name                = "my-first-azure-vm"
    resource_group_name = azurerm_resource_group.rg.name
    location            = azurerm_resource_group.rg.location
    size                = var.worker_nfs_vm_size
    admin_username      = "adminUsername"
    network_interface_ids = [ azurerm_network_interface.myNic1.id ]
    disable_password_authentication = true

    admin_ssh_key {
        username   = "adminUsername"
        public_key = file("~/.ssh/id_rsa.pub")
    }

    os_disk {
        caching              = "ReadWrite"
        storage_account_type = "Standard_LRS"
    }

    /*plan {
        name = "minimal-20_04-daily-lts"
        product = "minimal-20_04-daily-lts"
        publisher = "Canonical"
    }*/

    source_image_reference {
        publisher = "Canonical"
        offer = "0001-com-ubuntu-minimal-focal-daily"
        sku = "minimal-20_04-daily-lts"
        version = "20.04.202203030"
    }

    boot_diagnostics {
        storage_account_uri = azurerm_storage_account.stAccount.primary_blob_endpoint
    }

    tags = {
        environment = "CP2"
    }

}