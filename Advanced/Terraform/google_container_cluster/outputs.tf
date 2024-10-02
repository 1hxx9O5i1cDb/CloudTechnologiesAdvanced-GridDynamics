output "cluster_name" {
    description = "The Name of the Cluster"
    value = google_container_cluster.cluster.name
}

output "cluster_location" {
    description = "The Location of the Cluster"
    value = google_container_cluster.cluster.location
}