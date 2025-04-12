# Create a new GCP project
resource "google_project" "rivet_project" {
  name            = var.project_id
  project_id      = var.project_id
  billing_account = var.billing_account_id
}

# Create a storage bucket
resource "google_storage_bucket" "rivet_bucket" {
  name          = var.bucket_id
  location      = var.bucket_location
  project       = google_project.rivet_project.project_id
  force_destroy = true

  uniform_bucket_level_access = true

  versioning {
    enabled = true
  }
}

# Enable required APIs
resource "google_project_service" "required_apis" {
  for_each = toset([
    "lifesciences.googleapis.com",    # Cloud Life Sciences API
    "compute.googleapis.com",         # Compute Engine API
    "logging.googleapis.com"          # Cloud Logging API
  ])

  project = google_project.rivet_project.project_id
  service = each.value

  disable_dependent_services = true
  disable_on_destroy        = false
} 