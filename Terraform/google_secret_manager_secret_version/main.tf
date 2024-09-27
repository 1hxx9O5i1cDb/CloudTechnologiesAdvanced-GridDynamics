resource "google_secret_manager_secret_version" "secret_version" {
    secret = var.secret_id
    secret_data = var.password
}