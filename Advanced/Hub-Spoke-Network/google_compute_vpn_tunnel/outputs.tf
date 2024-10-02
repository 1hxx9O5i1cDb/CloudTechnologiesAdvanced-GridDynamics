output "vpn_tunnel_id" {
    description = "The ID of the VPN Tunnel"
    value = google_compute_vpn_tunnel.tunnel.id
}