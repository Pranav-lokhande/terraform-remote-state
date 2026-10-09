terraform {
  backend "s3" {
    bucket       = "USER-BUCKET"
    key          = "terraform.tfstate"
    region       = "us-east-1"
    use_lockfile = true
    encrypt      = true
  }
}
