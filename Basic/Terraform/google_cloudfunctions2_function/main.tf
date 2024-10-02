resource "google_cloudfunctions2_function" "function" {
    name = "kprusak-message-processor"
    description = "Message Processor Function"
    location = "europe-central2"

    build_config {
        runtime = "nodejs20"
        entry_point = "processMessage"
        
        source {
            storage_source {
                bucket = var.bucket_name
                object = var.object_name
            }
        }
    }

    service_config {
        max_instance_count = 3
        min_instance_count = 1
        available_memory = "256M"
        timeout_seconds = 60
    }

    event_trigger {
        event_type = "google.cloud.pubsub.topic.v1.messagePublished"
        pubsub_topic = var.topic_id
    }
}