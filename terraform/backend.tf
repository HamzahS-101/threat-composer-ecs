terraform {
  backend "s3" {
    bucket = "threat-composer-project"
    key    = "terraform.tfstate"
    region = "eu-west-2"
    use_lockfile = true
  }
}