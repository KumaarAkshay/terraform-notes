provider "google" {
  credentials = file(var.credentials)
  project     = var.project_id
  region      = var.region
}

locals {
  all_config = yamldecode(file("${path.module}/config/all_tables.yaml"))
}

resource "google_bigquery_dataset" "my_dataset" {
  dataset_id = var.bq_dataset_name
  location   = var.region
}

resource "google_bigquery_table" "tables" {
  for_each = { for table in local.all_config.tables : table.table_id => table }

  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  table_id   = each.value.table_id
  schema     = file("${path.module}/${each.value.schema_file}")

  time_partitioning {
    type  = each.value.partition_type
    field = each.value.partition_field
  }

  lifecycle {
    prevent_destroy = false
  }
}

resource "google_bigquery_routine" "procs" {
  # for_each = { for procedures in local.all_config : procedures.routine_id => procedures }
  for_each        = { for proc in local.all_config.procedures : proc.routine_id => proc }
  dataset_id      = google_bigquery_dataset.my_dataset.dataset_id
  routine_id      = each.value.routine_id
  routine_type    = each.value.routine_type
  definition_body = file("${path.module}/${each.value.definition}")
  language        = "SQL"
  lifecycle {
    prevent_destroy = false
  }

}

resource "google_bigquery_table" "view" {
  for_each = { for view in local.all_config.views : view.view_id => view }

  dataset_id = google_bigquery_dataset.my_dataset.dataset_id
  table_id   = each.value.view_id
  view {
    query          = file("${path.module}/${each.value.definition}")
    use_legacy_sql = false
  }
  lifecycle {
    prevent_destroy = false
  }

}
