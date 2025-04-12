# Rivet SARS-CoV-2 GCP Infrastructure

This Terraform configuration sets up the necessary GCP infrastructure for the Rivet SARS-CoV-2 project.

## Prerequisites

1. Install Terraform (version >= 1.0.0)
   ```bash
   # Using Homebrew on macOS
   brew tap hashicorp/tap
   brew install hashicorp/tap/terraform
   ```

2. Install Google Cloud SDK
   ```bash
   # Using Homebrew on macOS
   brew install --cask google-cloud-sdk
   ```

3. Authenticate with GCP:
   ```bash
   gcloud auth application-default login
   ```

4. Have a GCP billing account ID

## Configuration

1. Update the `terraform.tfvars` file with your specific values:
   - `project_id`: Your desired project ID
   - `bucket_id`: Your desired bucket name
   - `billing_account_id`: Your GCP billing account ID

## Usage

1. Initialize Terraform:
   ```bash
   terraform init
   ```

2. Review the planned changes:
   ```bash
   terraform plan
   ```

3. Apply the configuration:
   ```bash
   terraform apply
   ```

4. To destroy the infrastructure:
   ```bash
   terraform destroy
   ```

## Infrastructure Components

- GCP Project
- Cloud Storage Bucket with versioning enabled
- Uniform bucket-level access enabled 