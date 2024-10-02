output "object_name" {
    description = "The Name of the Object"
    value = google_storage_bucket_object.bucket_object.name
}