variable "project" {
  type    = string
  default = "graphite-byte-472516-n8"
}

variable "region" {
  type    = string
  default = "us-central1"
}

variable "dataset_id" {
  type    = string
  default = "ml_dataset"
}

variable "table_id" {
  type    = string
  default = "ml_table"
}

variable "repo_name" {
  type    = string
  default = "ml-repo"
}

variable "image_name" {
  type    = string
  default = "ml-api"
}

variable "docker_image_version" {
  description = "Versão da imagem Docker a ser usada no Cloud Run"
  type        = string
}
