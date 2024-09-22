resource "google_artifact_registry_repository" "registry" {
    repository_id = "docker-repo"
    format = "DOCKER"
    location = "europe-central2"

    cleanup_policies {
        id = "delete-prerelease"
        action = "DELETE"
        
        condition {
            tag_state = "TAGGED"
            older_than = "2592000s"
        }
    }
}