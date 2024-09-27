resource "google_container_node_pool" "node_pool" {
    cluster = var.cluster_name
    name = "addon-node-pool"
    location = var.cluster_location
    node_count = 3

    node_config {
        preemptible = false
        machine_type = "e2-medium"
    }

    autoscaling {
        min_node_count = 1
        max_node_count = 3
    }
}