resource "google_compute_address" "vpn_static_ip" {
    name = "vpn-static-ip"
    description = "Static IP Address for the VPN"
    region = "europe-central2"
}