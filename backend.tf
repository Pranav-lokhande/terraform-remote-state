terraform {
  backend "s3" {
    bucket       = "terraform-remote-state-311141558069-2026"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}