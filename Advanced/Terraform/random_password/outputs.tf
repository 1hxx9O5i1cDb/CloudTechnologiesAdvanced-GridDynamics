output "password" {
    description = "The Value of the Password"
    value = random_password.password.result
    sensitive = true
}