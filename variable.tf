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