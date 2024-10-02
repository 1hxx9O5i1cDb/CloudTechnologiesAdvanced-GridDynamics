resource "google_compute_vpn_gateway" "vpn_gateway" {
    name = "hub-vpn-gateway"
    region = "europe-central2"
    network = var.hub_network_uri
}