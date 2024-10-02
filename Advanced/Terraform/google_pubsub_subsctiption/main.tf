resource "google_pubsub_subscription" "subsctiption" {
    name = "img-processing-subsctiption"
    topic = var.topic_id 
}