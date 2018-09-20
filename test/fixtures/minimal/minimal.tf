// Instantiate a minimal version of the module for testing
provider "aws" {
  region = "us-east-1"
}

resource "random_id" "testing_suffix" {
  byte_length = 4
}

locals {
  logical_name = "${var.logical_name}${random_id.testing_suffix.hex}"
}

module "it_minimal" {
  source = "../../../" //minimal integration test

  logical_name = "${local.logical_name}"

  org   = "${var.org}"
  owner = "${var.owner}"
  env   = "${var.env}"
  app   = "${var.app}"
}

variable "logical_name" {
  type = "string"
}

variable "org" {
  type = "string"
}

variable "owner" {
  type = "string"
}

variable "env" {
  type = "string"
}

variable "app" {
  type = "string"
}

output "testing_suffix_hex" {
  value = "${random_id.testing_suffix.hex}"
}

output "starter.instance_id" {
  value = "${module.it_minimal.instance_id}"
}

output "starter.instance_arn" {
  value = "${module.it_minimal.instance_arn}"
}

output "terraform_state" {
  description = "The path to the Terraform state file; used in the state_file control"
  value       = "${path.cwd}/terraform.tfstate.d/${terraform.workspace}/terraform.tfstate"
}
