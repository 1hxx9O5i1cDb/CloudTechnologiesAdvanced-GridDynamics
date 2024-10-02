resource "google_compute_forwarding_rule" "esp_forwarding_rule" {
    name = "vpn-esp-rule"
    region = "europe-central2"
    ip_protocol = "ESP"
    target = var.vpn_gateway_id
    ip_address = var.ip_address
}

resource "google_compute_forwarding_rule" "udp500_forwarding_rule" {
    name = "vpn-udp500-rule"
    region = "europe-central2"
    ip_protocol = "UDP"
    port_range = "500"
    target = var.vpn_gateway_id
    ip_address = var.ip_address
}

resource "google_compute_forwarding_rule" "udp4500_forwarding_rule" {
    name = "vpn-udp4500-rule"
    region = "europe-central2"
    ip_protocol = "UDP"
    port_range = "4500"
    target = var.vpn_gateway_id
    ip_address = var.ip_address
}