provider "google" {
  credentials = file("terraform-key.json")
  project     = var.project
  region      = var.region
}

terraform {
  backend "gcs" {
    credentials = "terraform-key.json"
    bucket      = "terraform-sauter-university"
    prefix      = "terraform/state"
  }
}
