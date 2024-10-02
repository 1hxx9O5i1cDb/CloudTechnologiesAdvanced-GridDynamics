resource "google_artifact_registry_repository" "repository" {
    repository_id = "docker-repo-k8s"
    format = "DOCKER"
    location = "europe-central2"

    cleanup_policies {
        id = "delete-old-images"
        action = "DELETE"

        condition {
            tag_state = "ANY"
            older_than = "604800s"
        }
    }
}