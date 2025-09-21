provider "google" {
  #credentials = file("terraform-key.json")
  project     = "graphite-byte-472516-n8"
  region      = "us-central1"
  credentials = file("/tmp/sa.json")
}

terraform {  
  backend "gcs" {
     credentials = "terraform-key.json"
    bucket = "terraform-sauter-university"  
  }
}
