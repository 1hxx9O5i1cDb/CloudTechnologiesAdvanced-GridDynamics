resource "google_secret_manager_secret" "secret" {
    secret_id = "db-app-user-password"
    
    replication {
        auto {
            customer_managed_encryption {
                kms_key_name = "kms-key"
            }
        }
    }
}