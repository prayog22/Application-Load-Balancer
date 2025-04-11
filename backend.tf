terraform {
  backend "s3" {
    bucket = "store-state-file-bitbucket"
    key = "terraform.tfstate"
    region = "us-east-1"
    dynamodb_table = "table_for_store_state_bitbucket"
  }
}