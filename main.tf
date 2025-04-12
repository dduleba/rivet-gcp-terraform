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