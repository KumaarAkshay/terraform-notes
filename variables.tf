variable "credentials" {
  description = "My Credentials"
  type        = string
}
variable "project_id" {
  description = "The ID of the project in which the resource belongs."
  type        = string
}
variable "region" {
  description = "The region in which the resource is located."
  type        = string
}
variable "table_schemas" {
  type = map(string)
}
variable "bq_dataset_name" {
  description = "My BigQuery Dataset Name"
  #Update the below to what you want your dataset to be called
  default = "tf_dataset"
}
variable "procedures" {
  type = map(string)
}

variable "tables_config" {
  description = "A list of BigQuery table configurations."
  type = list(object({
    table_id        = string
    partition_field = string
    partition_type  = string
    schema_file     = string
  }))
  default = []
}

variable "procedures_config" {
  description = "A list of BigQuery procedure configurations."
  type = list(object({
    routine_id   = string
    definition   = string
    routine_type = string
  }))
  default = []

}

variable "views_config" {
  description = "A list of BigQuery procedure configurations."
  type = list(object({
    view_id    = string
    definition = string
    view_type  = string
  }))
  default = []

}