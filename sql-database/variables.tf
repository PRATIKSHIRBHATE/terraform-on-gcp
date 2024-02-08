variable "project" {}
variable "credentials_file" {
  sensitive = "true"
}
variable "db_password" {
  description = "Sensitive database password"
  type        = string
  sensitive   = true
}

variable "region" {
		default = "us-central1"
}
variable "zone" {
	default = "us-central1-a"
}