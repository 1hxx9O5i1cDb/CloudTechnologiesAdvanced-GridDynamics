resource "google_compute_subnetwork" "public_subnetwork" {
    name = "private-subnet"
    description = "Private Subnet - K8S"
    network = var.network_uri
    region = "europe-central2"
    ip_cidr_range = "10.0.1.0/24"
}

resource "google_compute_subnetwork" "private_subnetwork" {
    name = "private-subnet"
    description = "Private Subnet - K8S"
    network = var.network_uri
    region = "europe-central2"
    ip_cidr_range = "10.0.2.0/24"
    private_ip_google_access = true
}