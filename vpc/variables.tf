variable "project" {}
variable "credentials_file" {
  description = "Specify the absolute path of credentials json file"
}

variable "region" {
  default = "us-central1"
}
variable "zone" {
  default = "us-central1-a"
}
variable "os_image" {
  default = "debian-cloud/debian-11"
}

variable "vpc_name" {}