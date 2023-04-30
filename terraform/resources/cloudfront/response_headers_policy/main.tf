# Amazon CloudFront Response Header Policy
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_response_headers_policy

resource "aws_cloudfront_response_headers_policy" "this" {
  comment = var.comment
  name    = var.name

  dynamic "cors_config" {
    for_each = var.cors_config
    content {
      access_control_allow_credentials = cors_config.value.access_control_allow_credentials

      access_control_allow_headers {
        items = cors_config.value.access_control_allow_headers
      }

      access_control_allow_methods {
        items = cors_config.value.access_control_allow_methods
      }

      access_control_allow_origins {
        items = cors_config.value.access_control_allow_origins
      }

      origin_override = cors_config.value.origin_override
    }
  }

  dynamic "custom_headers_config" {
    for_each = var.custom_headers_config
    content {
      items {
        header   = custom_headers_config.value.header
        override = custom_headers_config.value.override
        value    = custom_headers_config.value.value
      }
    }
  }

  dynamic "server_timing_headers_config" {
    for_each = var.server_timing_headers_config
    content {
      enabled       = server_timing_headers_config.value.enabled
      sampling_rate = server_timing_headers_config.value.sampling_rate
    }
  }
}
