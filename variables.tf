variable "project_id" {
  description = "The ID of the project to create"
  type        = string
}

variable "region" {
  description = "The region to deploy to"
  type        = string
  default     = "us-central1"
}

variable "bucket_id" {
  description = "The name of the bucket to create"
  type        = string
  default     = "rivet-data"
}

variable "bucket_location" {
  description = "The location of the bucket"
  type        = string
  default     = "us-central1"
}

variable "billing_account_id" {
  description = "The ID of the billing account to associate with the project"
  type        = string
} 