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