resource "google_compute_network_peering" "hob_to_spoke" {
    name = "hub-to-spoke"
    network = var.hub_network_uri
    peer_network = var.spoke_network_uri
}

resource "google_compute_network_peering" "spoke_to_hub" {
    name = "spoke-to-hub"
    network = var.spoke_network_uri
    peer_network = var.hub_network_uri
}