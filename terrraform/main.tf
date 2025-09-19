# Provedor que vai conectar ao Google Cloud
provider "google" {
    project = "graphite-byte-472516-n8"
    region = "us-central1"
  
}
# Acesso a serviços do Cloud Run (BigQuery, Cloud Strogae etc..)
resource "google_service_account" "ml_api_sa" {
  account_id = "ml-api-sa"
  display_name = "Service Account para Cloud Run API"
}
# Dar permissão de BigQuery para a Service Account
resource "google_project_iam_member" "ml_api_sa_bigquery" {
  project = "SEU_PROJECT_ID_AQUI"
  role    = "roles/bigquery.dataEditor"
  member  = "serviceAccount:${google_service_account.ml_api_sa.email}"
}
# Criar dataset no BigQuery
resource "google_bigquery_dataset" "ml_dataset" {
  dataset_id = "ml_dataset"
  location   = "US"
}

# Criar tabela de exemplo
resource "google_bigquery_table" "ml_table" {
  dataset_id = google_bigquery_dataset.ml_dataset.dataset_id
  table_id   = "ml_table"
  schema     = <<EOF
[
  {
    "name": "id",
    "type": "INTEGER",
    "mode": "REQUIRED"
  },
  {
    "name": "nome",
    "type": "STRING",
    "mode": "REQUIRED"
  },
  {
    "name": "valor",
    "type": "FLOAT",
    "mode": "REQUIRED"
  }
]
EOF
}

# Criar API no Cloud Run
resource "google_cloud_run_service" "api" {
    name = "ml-api"
  location = "us-central1"


  template {
    spec {
      service_account_name = google_service_account.ml_api_sa.email
      
      containers {
        image = "micaelleffr/nome-da-imagem:latest"
      }
    }
  }

traffic {
  percent = 100
  latest_revision = true
  }
}

