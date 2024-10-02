resource "google_compute_firewall" "allow_vpn_traffic" {
    name = "allow-vpn-traffic"
    description = "Allow VPN Traffic"
    network = var.hub_network_uri

    allow {
        protocol = "UDP"
        ports = [ "500", "4500" ]
    }

    source_ranges = [ "0.0.0.0/0" ]
}

resource "google_compute_firewall" "allow_spoke_to_hub_traffic" {
    name = "allow-spoke-to-hub-traffic"
    description = "Allow Spoke to Hub Traffic"
    network = var.spoke_network_uri

    allow {
        protocol = "tcp"
    }

    allow {
        protocol = "udp"
    }

    allow {
        protocol = "icmp"
    }

    source_ranges = [ "0.0.0.0/0" ]
}

resource "google_compute_firewall" "allow_hub_to_spoke_traffic" {
    name = "allow-hub-to-spoke-traffic"
    description = "Allow Hub to Spoke Traffic"
    network = var.hub_network_uri

    allow {
        protocol = "tcp"
    }

    allow {
        protocol = "udp"
    }

    allow {
        protocol = "icmp"
    }

    source_ranges = [ "0.0.0.0/0" ]
}