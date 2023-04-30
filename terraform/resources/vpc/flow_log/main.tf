# Amazon VPC Flow Log
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/flow_log

resource "aws_flow_log" "this" {
  eni_id                        = var.eni_id
  iam_role_arn                  = var.iam_role_arn
  log_destination               = var.log_destination
  log_destination_type          = var.log_destination_type
  log_group_name                = var.log_group_name
  subnet_id                     = var.subnet_id
  tags                          = merge(var.tags, { "Name" = var.name })
  transit_gateway_attachment_id = var.transit_gateway_attachment_id
  transit_gateway_id            = var.transit_gateway_id
  traffic_type                  = var.traffic_type
  vpc_id                        = var.vpc_id

  destination_options {
    file_format                = var.file_format
    hive_compatible_partitions = var.hive_compatible_partitions
    per_hour_partition         = var.per_hour_partition
  }
}
