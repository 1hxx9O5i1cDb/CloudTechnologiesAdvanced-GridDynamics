output "secret_id" {
    description = ""
    value = google_secret_manager_secret.secret.id
}