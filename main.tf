# Recommendation: Rename this file (main.tf) so that it describes the resources contained within this file.
#
# Examples:
#   ingress.tf describes a collection of CDN, DNS, Load Balancer resources well
#   rds_sql_server.tf describe the instantiation of an RDS SQL Server cluster
#

# Define locals for private data and computations
locals {
  fq_name = "${var.org}-${var.env}-${var.logical_name}"
}

# Use resource and module definitions to implement this module

# The following resource definitions are placeholders and should be replaced by your own

resource "random_id" "placeholder" {
  byte_length = 4
  prefix      = "starter-"
}

data "template_file" "placholder_resource_arn" {
  template = "arn:aws:starter:us-west-2::$${resource_id}"

  vars {
    resource_id = "${random_id.placeholder.b64}"
  }
}
