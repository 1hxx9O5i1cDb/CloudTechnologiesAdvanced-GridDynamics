output "hub_network_uri" {
    description = "The URI of the Hub Network"
    value = google_compute_network.hub_network.self_link
}

output "spoke_network_uri" {
    description = "The URI of the Spoke Network"
    value = google_compute_network.spoke_network.self_link
}