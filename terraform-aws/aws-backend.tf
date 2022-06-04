terraform {
    backend "s3" {
        bucket = "tis-automation-challenge"
        region = "us-east-1"
        encrypt = "true"
        key = "tf-state/terraform.tfstate"
    }
}