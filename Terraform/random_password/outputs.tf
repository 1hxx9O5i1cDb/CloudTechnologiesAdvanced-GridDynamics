output "password" {
    description = ""
    value = random_password.password.result
    sensitive = true
}