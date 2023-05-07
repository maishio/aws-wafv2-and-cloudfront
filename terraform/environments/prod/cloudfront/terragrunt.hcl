# Terragrunt terraform
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#terraform

terraform {
  source = "../../..//modules/cloudfront"
}

# Terragrunt include
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#include

include {
  path = find_in_parent_folders()
}

# Terragrunt dependency
# https://terragrunt.gruntwork.io/docs/reference/config-blocks-and-attributes/#dependency

dependency "alb" {
  config_path = "../alb"

  mock_outputs = {
    alb_id       = "arn:aws:elasticloadbalancing:us-east-1:123456789012:loadbalancer/app/xxxxxxxxxxxxxx/xxxxxxxxxxxxxxxx"
    alb_dns_name = "xxxxxxxxxxxxxxxxxxxxxxxxxx.us-east-1.elb.amazonaws.com"
  }
}

# Terragrunt inputs
# https://terragrunt.gruntwork.io/docs/features/inputs/#inputs

inputs = {
  alb_id       = dependency.alb.outputs.alb_id
  alb_dns_name = dependency.alb.outputs.alb_dns_name
}
