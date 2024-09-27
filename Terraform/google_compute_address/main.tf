resource "google_compute_address" "address" {
    name = "gke-lb-address"
    region = "europe-central2"
}