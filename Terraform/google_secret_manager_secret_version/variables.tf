variable "secret_id" {
    description = "The ID of the Secret"
    type = string
}

variable "password" {
    description = "The Value of the Password"
    type = string
    sensitive = true
}