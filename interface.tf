variable "logical_name" {
  type        = "string"
  description = "Specify the 'logical' name that distinguishes resources created by this module by its use case or function, e.g. media or orders"
}

variable "org" {
  type        = "string"
  description = "Short id of the organization that owns the bucket"
}

variable "owner" {
  type        = "string"
  description = "Name of the team or department that responsible for the bucket"
}

variable "env" {
  type        = "string"
  description = "Name of the environment the bucket supports"
}

variable "app" {
  type        = "string"
  description = "Name of the application the bucket supports"
}

output "instance_id" {
  value = "${random_id.placeholder.b64}"
}

output "instance_arn" {
  value = "${data.template_file.placholder_resource_arn.rendered}"
}
