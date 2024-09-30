resource "google_compute_network" "hub_network" {
    name = "hub-vpc"
    description = "Hub Network"
    auto_create_subnetworks = false
}

resource "google_compute_network" "spoke_network" {
    name = "spoke-network"
    description = "Spoke Network"
    auto_create_subnetworks = false
}