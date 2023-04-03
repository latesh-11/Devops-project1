variable "Access_Key" {
    type = string
}

variable "Secret_Key" {
    type = string
}

variable "ports" {
  type = list(number)
  default = [ 22,9000,8080,8000 ]
}

variable "AMI_Name" {
  type = string
}