# Rivet SARS-CoV-2 GCP Infrastructure

This Terraform configuration sets up the necessary GCP infrastructure for the Rivet SARS-CoV-2 project.

It is done based on instructions from https://turakhia.ucsd.edu/rivet/gcp_setup.html

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
   ```bash
   # To get your billing account ID, run:
   gcloud billing accounts list
   ```

## Configuration

1. Create a `terraform.tfvars` file in the project root directory:
   ```bash
   touch terraform.tfvars
   ```

2. Update the `terraform.tfvars` file with your specific values:
   - `project_id`: Your desired project ID
   - `bucket_id`: Your desired bucket name
   - `billing_account_id`: Your GCP billing account ID (from step 4 in Prerequisites)

   Example `terraform.tfvars` content:
   ```hcl
   project_id = "your-project-id"
   bucket_id = "your-bucket-name"
   billing_account_id = "XXXXXX-XXXXXX-XXXXXX"  # Format: XXXXXX-XXXXXX-XXXXXX
   ```

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
