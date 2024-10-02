output "bucket_name" {
    description = "The Name of the Bucket"
    value = google_storage_bucket.bucket.name
}