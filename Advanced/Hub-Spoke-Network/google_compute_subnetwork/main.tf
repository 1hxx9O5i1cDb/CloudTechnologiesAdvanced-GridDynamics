resource "google_compute_subnetwork" "hub_subnetwork" {
    name = "hub-subnetwork"
    ip_cidr_range = "10.0.1.0/24"
    region = "europe-central2"
    network = var.hub_network_uri
}

resource "google_compute_subnetwork" "spoke_subnetwork" {
    name = "spoke-subnetwork"
    ip_cidr_range = "10.0.2.0/24"
    region = "europe-central2"
    network = var.spoke_network_uri
}