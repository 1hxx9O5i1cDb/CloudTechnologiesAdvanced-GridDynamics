output "vpn_tunnel_uri" {
    description = "The URI of the VPN Tunnel"
    value = google_compute_vpn_tunnel.tunnel.self_link
}