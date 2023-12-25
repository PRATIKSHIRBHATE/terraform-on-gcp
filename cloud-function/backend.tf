terraform {
    backend "gcs" {
        bucket  = "terraform_state_lock_files"
        prefix  = "terraform/cloud-function"
    }
}
