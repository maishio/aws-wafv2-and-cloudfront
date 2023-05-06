# Amazon CloudFront Distribution
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution

resource "aws_cloudfront_distribution" "this" {
  aliases             = var.aliases
  comment             = var.comment
  default_root_object = var.default_root_object
  enabled             = var.enabled
  http_version        = var.http_version
  is_ipv6_enabled     = var.is_ipv6_enabled
  price_class         = var.price_class
  retain_on_delete    = var.retain_on_delete
  tags                = merge(var.tags, { "Name" = var.name })
  wait_for_deployment = var.wait_for_deployment
  web_acl_id          = var.web_acl_id

  logging_config {
    bucket          = var.bucket
    include_cookies = var.include_cookies
    prefix          = var.prefix
  }

  default_cache_behavior {
    allowed_methods            = var.allowed_methods
    cached_methods             = var.cached_methods
    cache_policy_id            = var.cache_policy_id
    compress                   = var.compress
    default_ttl                = var.default_ttl
    max_ttl                    = var.max_ttl
    min_ttl                    = var.min_ttl
    origin_request_policy_id   = var.origin_request_policy_id
    response_headers_policy_id = var.response_headers_policy_id
    smooth_streaming           = var.smooth_streaming
    target_origin_id           = var.target_origin_id
    trusted_key_groups         = var.trusted_key_groups
    trusted_signers            = var.trusted_signers
    viewer_protocol_policy     = var.viewer_protocol_policy

    dynamic "forwarded_values" {
      for_each = var.forwarded_values
      content {
        headers                 = lookup(forwarded_values, "headers", [])
        query_string            = lookup(forwarded_values, "query_string", false)
        query_string_cache_keys = lookup(forwarded_values, "query_string_cache_keys", [])

        cookies {
          forward           = lookup(forwarded_values, "forward", "none")
          whitelisted_names = lookup(forwarded_values, "whitelisted_names", [])
        }
      }
    }
  }

  dynamic "ordered_cache_behavior" {
    for_each = var.ordered_cache_behavior
    content {
      allowed_methods            = ordered_cache_behavior.value.allowed_methods
      cached_methods             = ordered_cache_behavior.value.cached_methods
      cache_policy_id            = lookup(ordered_cache_behavior.value, "cache_policy_id", null)
      compress                   = lookup(ordered_cache_behavior.value, "compress", true)
      default_ttl                = lookup(ordered_cache_behavior.value, "default_ttl", 86400)
      max_ttl                    = lookup(ordered_cache_behavior.value, "max_ttl", 31536000)
      min_ttl                    = lookup(ordered_cache_behavior.value, "min_ttl", 0)
      origin_request_policy_id   = lookup(ordered_cache_behavior.value, "origin_request_policy_id", null)
      response_headers_policy_id = lookup(ordered_cache_behavior.value, "response_headers_policy_id", null)
      path_pattern               = ordered_cache_behavior.value.path_pattern
      smooth_streaming           = lookup(ordered_cache_behavior.value, "smooth_streaming", false)
      target_origin_id           = ordered_cache_behavior.value.target_origin_id
      trusted_key_groups         = lookup(ordered_cache_behavior.value, "trusted_key_groups", [])
      trusted_signers            = lookup(ordered_cache_behavior.value, "trusted_signers", [])
      viewer_protocol_policy     = lookup(ordered_cache_behavior.value, "viewer_protocol_policy", "llow-all")

      forwarded_values {
        headers                 = lookup(ordered_cache_behavior, "headers", [])
        query_string            = lookup(ordered_cache_behavior, "query_string", false)
        query_string_cache_keys = lookup(ordered_cache_behavior, "query_string_cache_keys", [])

        cookies {
          forward           = lookup(ordered_cache_behavior, "forward", "none")
          whitelisted_names = lookup(ordered_cache_behavior, "whitelisted_names", [])
        }
      }
    }
  }

  dynamic "origin" {
    for_each = var.origin
    content {
      connection_attempts      = lookup(origin.value, "connection_attempts", 3)
      connection_timeout       = lookup(origin.value, "connection_timeout", 10)
      domain_name              = origin.value.domain_name
      origin_id                = origin.value.origin_id
      origin_access_control_id = lookup(origin.value, "origin_access_control_id", null)
      origin_path              = lookup(origin.value, "origin_path", null)

      dynamic "custom_origin_config" {
        for_each = lookup(origin.value, "custom_origin_config", [])
        content {
          http_port                = custom_origin_config.value.http_port
          https_port               = custom_origin_config.value.https_port
          origin_keepalive_timeout = lookup(custom_origin_config.value, "origin_keepalive_timeout", 60)
          origin_protocol_policy   = custom_origin_config.value.origin_protocol_policy
          origin_read_timeout      = lookup(custom_origin_config.value, "origin_read_timeout", 60)
          origin_ssl_protocols     = custom_origin_config.value.origin_ssl_protocols
        }
      }

      dynamic "s3_origin_config" {
        for_each = lookup(origin.value, "s3_origin_config", [])
        content {
          origin_access_identity = s3_origin_config.value.origin_access_identity
        }
      }
    }
  }

  restrictions {
    geo_restriction {
      locations        = var.locations
      restriction_type = var.restriction_type
    }
  }

  viewer_certificate {
    acm_certificate_arn            = var.acm_certificate_arn
    cloudfront_default_certificate = var.cloudfront_default_certificate
    minimum_protocol_version       = var.minimum_protocol_version
    ssl_support_method             = var.ssl_support_method
  }
}
