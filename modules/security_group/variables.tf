# Security Group variables

variable "sg_name" {
    description = "Security group name"
    type = string
    default = "for_ec2" 
}

variable "ssh_ip" {
    description = "Allowed addresses for SSH"
    type = list(string)
    default = [ "178.159.239.135/32" ]  
}
