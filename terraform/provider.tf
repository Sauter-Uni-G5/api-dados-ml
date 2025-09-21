terraform {
  required_providers {
    google = {
      source  = "hashicorp/google"
      version = ">= 4.0.0"
    }
  }

  backend "gcs" {
    bucket      = "terraform-sauter-university"
    prefix      = "terraform/state"
  }
}

provider "google" {
  project = var.project
  region  = var.region
}
