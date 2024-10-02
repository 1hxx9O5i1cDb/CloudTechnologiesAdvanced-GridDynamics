resource "google_compute_vpn_tunnel" "tunnel" {
    name = "hub-vpn-tunnel"
    region = "europe-central2"
    target_vpn_gateway = var.vpn_gateway_id
    peer_ip = var.peer_ip
    shared_secret = var.shared_secret
    ike_version = 2

    local_traffic_selector = [
        "0.0.0.0/0"
    ]

    remote_traffic_selector = [
        "0.0.0.0/0"
    ]
}