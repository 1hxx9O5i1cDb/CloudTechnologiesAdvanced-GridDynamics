resource "google_storage_bucket" "bucket" {
    name = "object-bucket"
    location = "europe-central2"

    # Ensure High Availability
    storage_class = "STANDARD"

    versioning {
        enabled = true
    }

    lifecycle_rule {
        action {
            type = "SetStorageClass"
            storage_class = "NEARLINE"
        }
        condition {
            age = 30
        }
    }
}