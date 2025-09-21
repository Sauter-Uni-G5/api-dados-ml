provider "google" {
  project = var.project
  region  = var.region
}

resource "google_cloud_run_service" "api" {
  name     = var.image_name
  location = var.region

  template {
    spec {
      containers {
        image = "us-central1-docker.pkg.dev/${var.project}/${var.repo_name}/${var.image_name}:${var.docker_image_version}"
      }
    }
  }

  traffic {
    percent         = 100
    latest_revision = true
  }
}
