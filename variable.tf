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
    default = ["10.0.0.0/16", "10.0.4.0", 24]
}