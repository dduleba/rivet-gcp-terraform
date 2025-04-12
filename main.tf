# Create a new GCP project
resource "google_project" "rivet_project" {
  name            = var.project_id
  project_id      = var.project_id
  billing_account = var.billing_account_id
}

# Create a service account
resource "google_service_account" "rivet_service_account" {
  account_id   = "rivet-service-account"
  display_name = "Rivet Service Account"
  project      = google_project.rivet_project.project_id
}

# Grant the service account the necessary roles
resource "google_project_iam_member" "service_account_roles" {
  for_each = toset([
    "roles/storage.objectViewer",    # Allows reading objects from Cloud Storage
    "roles/lifesciences.workflowsRunner"  # Allows running Life Sciences workflows
  ])

  project = google_project.rivet_project.project_id
  role    = each.value
  member  = "serviceAccount:${google_service_account.rivet_service_account.email}"
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

# Create a service account key
resource "google_service_account_key" "rivet_service_account_key" {
  service_account_id = google_service_account.rivet_service_account.name
}

# Output the service account key (sensitive)
output "service_account_key" {
  value     = base64decode(google_service_account_key.rivet_service_account_key.private_key)
  sensitive = true
  description = "The private key of the service account in JSON format"
} 