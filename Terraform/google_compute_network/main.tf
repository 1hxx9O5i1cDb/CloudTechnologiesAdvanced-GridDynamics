resource "google_compute_network" "network" {
    name = "k8s-high-availability-network"
    description = "Network for K8S"
    auto_create_subnetworks = false
}