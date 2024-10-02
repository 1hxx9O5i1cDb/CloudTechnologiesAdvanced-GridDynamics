module "google_pubsub_topic" {
    source = "./google_pubsub_topic"
}

module "google_storage_bucket" {
    source = "./google_storage_bucket"
    depends_on = [ module.google_pubsub_topic ]
}

module "google_storage_bucket_object" {
    source = "./google_storage_bucket_object"
    bucket_name = module.google_storage_bucket.bucket_name
    depends_on = [ module.google_storage_bucket ]
}

module "google_cloudfunctions2_function" {
    source = "./google_cloudfunctions2_function"
    bucket_name = module.google_storage_bucket.bucket_name
    object_name = module.google_storage_bucket_object.object_name
    topic_id = module.google_pubsub_topic.topic_id
    depends_on = [ module.google_storage_bucket_object ]
}