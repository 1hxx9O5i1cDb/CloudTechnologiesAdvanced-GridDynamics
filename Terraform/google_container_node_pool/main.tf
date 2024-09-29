resource "google_container_node_pool" "node_pool" {
    cluster = var.cluster_name
    name = "addon-node-pool"
    location = var.cluster_location
    node_count = 2

    node_config {
        preemptible = false
        machine_type = "n1-standard-1"

        labels = {
            "node-type" = "addons"
        }

        taint {
            key = "addon-node"
            value = "true"
            effect = "NoSchedule"
        }
    }

    # autoscaling {
    #     min_node_count = 1
    #     max_node_count = 3
    # }

    management {
        auto_repair = true
        auto_upgrade = true
    }
}