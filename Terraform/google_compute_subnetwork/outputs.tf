output "subnetwork_uri" {
    description = "The URI of the Private Subnetwork"
    value = google_compute_subnetwork.private_subnetwork.self_link
}