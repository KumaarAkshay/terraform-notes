provider "google" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.region
}

resource "google_bigquery_table" "tables" {
  for_each   = var.table_schemas
  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  table_id   = each.key
  schema     = file(each.value)
  lifecycle {
    prevent_destroy = false
  }
}
resource "google_bigquery_routine" "procedures" {
  for_each      = var.procedures
  dataset_id    = google_bigquery_dataset.my_dataset.dataset_id
  routine_id    = each.key
  routine_type  = "PROCEDURE"
  language      = "SQL"
  definition_body = file(each.value)
}