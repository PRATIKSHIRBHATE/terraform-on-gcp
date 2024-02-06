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

variable "firewall_rule_name" {}
variable "network_name" {}

variable "ip_ranges" {
  default = ["10.3.1.0/24", "10.3.2.0/24", "0.0.0.0/0"]
}