resource "google_artifact_registry_repository" "registry" {
    repository_id = "docker-repo"
    format = "DOCKER"
    location = "europe-central2"

    cleanup_policies {
        id = "delete-old-images"
        action = "DELETE"
        
        condition {
            tag_state = "ANY"
            older_than = "604800s"  # 7 Days
        }
    }
}