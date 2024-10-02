output "ip_address" {
    description = "The Static IP Address"
    value = google_compute_address.vpn_static_ip.address
}