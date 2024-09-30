output "secret_id" {
    description = "The ID of the Secret"
    value = google_secret_manager_secret.secret.id
}