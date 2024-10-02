variable "instance_uri" {
    description = "THe URI of the Instance"
    type = string
}

variable "password" {
    description = "The Value of the Password"
    type = string
    sensitive = true
}