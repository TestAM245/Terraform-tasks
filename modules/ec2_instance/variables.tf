# EC2 variables

variable "ec_type" {
    type = string
    default = "t2.micro"
}

variable "ami_id" {
    type = string
    default = "ami-0e04bcbe83a83792e"
}


variable "custom_data" {
    description = "Path to custom startup script"
  
}


variable "security_group_id" {
    description = "Specify security grouo ID"
    type = list(string)
  
}


variable "ssh_key" {
    type = string
    default = "ssh-rsa AAAAB3NzaC1yc2EAAAADAQABAAACAQCvvKXEaj9ZT5czvaG5lToCZMx5DMwwU4ndtWmpXqvi1yIc2QlYSkmSQWhuSfN2RoIPZjGwnd3mxscynPDLhceU1yuEMsZRBIGZEkq+9qxXovtAxsCF4bZ2hWhc7fgXyzP7OIemSMKDZrOVlKdn9uVXXfCfpJ3REwEgs+gNyfKfqf0pSqgV5Fc/ALIHUF7keadG0WJkaEB5OgzAZAitxtF1Drmyq7ZCDlpJlV3Y7IRBVGnsbOlhZzW1T2NbLrMkWz6FhJTS68nPZZ5i1x5csp75H1somZNi2a0j79YLphLGqCOBgZBB/Yx1XMGSM7SHjFXLo5VJbw9ywm6r9wofn5OUujmrabZ0r8c2W51dVJnr9wxu7AQ1ngEADBw+V9EjRKfXP/Dj1x6YyfFTjSza28KUXdv+c+ujEhpa5wfXTqPhrZS5N8LpTolClrZYYQc1qF1Z2u15sXokuuf9H8gYLIvyvmpdIAP1Nqa+LxhaMGhizsyNfEKFCDiw79rld1Qi7H4D+PPXa6LQu4xtvZ/u6qxoLrKqPPebC/TY2tNbpQQAb5NBQ/lDvQIhB6OSDBSyXtWDFQZ9TkdGikFq95jQLsVQF0BTR+adj7JMo30Vds38r/ij6u/wPfwnalyCRZ3EG2aKXSXpjDQ7g0AtLETT+zZR4IGjz5lFW343F4OxHnBTIQ== anrey@DESKTOP-ECBG7A8" 
}


variable "instance_profile" {
    type = string

}