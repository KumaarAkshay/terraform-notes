credentials = "/workspaces/terraform-notes/key.json"
project_id  = "project-info-prac"
region      = "asia-south2"
# machine_type = "e2-medium"
# zone         = "asia-south2-a"
# image        = "projects/ubuntu-os-cloud/global/images/ubuntu-2004-focal-v20250111"
# location     = "US"
bq_dataset_name = "tf_dataset"
table_schemas = {
  table1 = "schemas/table1.json"
  table2 = "schemas/table2.json"
  table3 = "schemas/table3.json"
}
procedures = {
  proc1 = "procedures/proc1.sql"
}

