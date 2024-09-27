resource "google_storage_bucket" "bucket" {
    name = "object-bucket-k8s-gd"
    location = "europe-central2"
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
            age = 30    # 30 Days
        }
    }

    lifecycle_rule {
        action {
            type = "Delete"
        }
        condition {
            age = 365   # 365 Days
        }
    }

    uniform_bucket_level_access = true
}