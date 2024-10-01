resource "google_compute_route" "vpn_route_hub" {
    name = "vpn-route-hub"
    network = var.hub_network_uri
    dest_range = "0.0.0.0/0"
    next_hop_vpn_tunnel = var.vpn_tunnel_id
}