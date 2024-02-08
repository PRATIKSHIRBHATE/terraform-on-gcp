variable "project" {}
variable "credentials_file" {
  sensitive = "true"
}
variable "instance_name" {}

variable "region" {
		default = "us-central1"
}
variable "zone" {
	default = "us-central1-a"
}
variable "os_image" {
	default = "debian-cloud/debian-11"
}

variable "environment" {
  type        = string
  description = "enviornment name"
  validation {
    condition = can(regex("^(production|test|stage|dev)$", var.environment))
    error_message = "Invalid Enviornment. Must either production|test!stage|dev"
  }
  }

variable "instance_type" {
  type        = string
  description = "Disk type of the Google Compute instance"
  default     = "f1-micro"
  validation {
    condition = can(regex("^(f1-micro|f1-medium)$", var.instance_type))
    error_message = "Invalid Instance type. Must be f1-micro"
  }
  }