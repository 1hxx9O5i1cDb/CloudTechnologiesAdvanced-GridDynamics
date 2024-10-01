resource "google_compute_global_address" "private_ip_address" {
    name = "google-managed-services-private-ip"
    purpose = "VPC_PEERING"
    address_type = "INTERNAL"
    prefix_length = 16
    network = var.network_uri
}