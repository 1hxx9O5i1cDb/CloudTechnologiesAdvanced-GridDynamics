resource "google_compute_subnetwork" "subnetwork" {
    name = "private-subnet"
    description = ""
    network = ""
    ip_cidr_range = "10.0.0.0/24"
}