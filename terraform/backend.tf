terraform {
  backend "s3"{
    bucket = "latesh-tf-state"
    region = "us-east-1"
    key = "terraform.tfstate"
    dynamodb_table = "latesh-tf-state-table"
  }
}