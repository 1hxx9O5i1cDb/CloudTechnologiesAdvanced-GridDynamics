resource "google_storage_bucket" "bucket" {
    name = "kprusak-function-bucket"
    location = "europe-central2"
    force_destroy = false
}