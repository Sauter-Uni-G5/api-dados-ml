variable "project" {
    type = string
    default = "graphite-byte-472516-n8"
  
}

variable "region" {
    type = string
    default = "us-central1"
  
}

variable "dataset_id" {
    type = string
    default = "ml_dataset"
  
}

variable "table_id" {
    type = string
    default = "ml_table"
  
}

/*variable "image" {
  default = "us-central1-docker.pkg.dev/graphite-byte-472516-n8/ml-repo/ml-api:3.10"
}*/

variable "docker_image_version" {
  description = "Versão da imagem Docker a ser usada no Cloud Run"
  type        = string
}

