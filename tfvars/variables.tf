variable "instance" {
    type = map
}

variable "domain_name" {
  default = "nikhilvaranasi.online"
}
variable "zone_id" {
  default = "Z06638764WSB8DJ5XHCK"
}

variable "common_tags" {
    default = {
        project = "expense"
        Terraform = "true"
    }
}
variable "tags" {
    type = map
}
variable "environment" {
    
}