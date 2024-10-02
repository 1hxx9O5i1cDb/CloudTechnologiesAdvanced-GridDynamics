output "vpn_gateway_id" {
    description = "The ID of the VPN Gateway"
    value = google_compute_vpn_gateway.vpn_gateway.id
}