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