variable "environment"{
    type = string
    description = "env type"
    default = "Staging"
}
variable "storage-disk"{
    type = number
    description = "disk size"
    default = 32
}
variable "delete-disk"{
    type = bool
    description = "deletion of disk"
    default = true
}

variable "allowed-locations"{
    type = list(string)
    description = "locations"
    default = [ "West Europe" , "North Europe" , "East US" ]
}
variable "allowed-tags"{
    type = map(string)
    description = "tags to apply to the resources"
    default = {
        "environment" = "staging"
        "managed_by" = "terraform"
        "department" = "devops"
    }
}

variable "network"{
    type = tuple([string, string, number])
    description = "tags to apply to network"
    default = ["10.0.0.0/16", "10.0.2.0", 24]
}

variable "size"{
    type = list(string)
    description = "size"
    default = [ "Standard_DS1_v2", "Standard_DS2_v2", "Standard_DS3_v2", "Standard_B1ls" ]
}

variable "vm"{
    type = object({
        size = string
        publisher = string
        offer = string
        sku = string
        version = string
})
    description = "vm"
    default = {
        size = "Standard_DS1_v2"
        publisher = "Canonical"
        offer     = "0001-com-ubuntu-server-jammy"
        sku       = "22_04-lts"
        version   = "latest"
    }
}

variable "sname"{
    type = set(string)
    description = "storage account name"
    default = ["pratishjangam1", "pratishjangam2", "pratishjangam3"]
}