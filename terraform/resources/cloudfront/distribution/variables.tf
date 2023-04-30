# Amazon CloudFront Distribution
# https://registry.terraform.io/providers/hashicorp/aws/latest/docs/resources/cloudfront_distribution

/* Top-level Arguments */

variable "aliases" {
  description = "Extra CNAMEs (alternate domain names), if any, for this distribution."
  type        = list(string)
  default     = []
}

variable "comment" {
  description = "Any comments you want to include about the distribution."
  type        = string
  default     = "Managed by Terraform"
}

variable "default_root_object" {
  description = "Object that you want CloudFront to return (for example, index.html) when an end user requests the root URL."
  type        = string
  default     = null
}

variable "enabled" {
  description = "Whether the distribution is enabled to accept end user requests for content."
  type        = bool
}

variable "http_version" {
  description = "Maximum HTTP version to support on the distribution."
  type        = string
  default     = "http2"
}

variable "is_ipv6_enabled" {
  description = "Whether IPv6 is enabled for the distribution."
  type        = bool
  default     = false
}

variable "name" {
  description = "Name of the distribution."
  type        = string
}

variable "price_class" {
  description = "Price class for this distribution."
  type        = string
  default     = "PriceClass_All"
}

variable "retain_on_delete" {
  description = "Disables the distribution instead of deleting it when destroying the resource through Terraform."
  type        = bool
  default     = false
}

variable "tags" {
  description = "A map of tags to assign to the resource."
  type        = map(string)
  default     = {}
}

variable "wait_for_deployment" {
  description = "Whether to wait for the distribution deployment to complete."
  type        = bool
  default     = true
}

variable "web_acl_id" {
  description = "The Web ACL Id (if any) associated with the distribution."
  type        = string
  default     = null
}

/* Logging Config Arguments */

variable "bucket" {
  description = "Amazon S3 bucket to store the access logs in."
  type        = string
}

variable "include_cookies" {
  description = "Whether to include cookies in access logs."
  type        = bool
  default     = false
}

variable "prefix" {
  description = "Prefix to the access log filenames for this distribution."
  type        = string
  default     = null
}

/* Default Cache Behavior Arguments */

variable "allowed_methods" {
  description = "Controls which HTTP methods CloudFront processes and forwards to your Amazon S3 bucket or your custom origin."
  type        = list(string)
  default     = []
}

variable "cache_policy_id" {
  description = "Controls whether CloudFront caches the response to requests using the specified HTTP methods."
  type        = string
  default     = null
}

variable "cached_methods" {
  description = "Unique identifier of the cache policy that is attached to the cache behavior."
  type        = list(string)
  default     = []
}

variable "compress" {
  description = "Whether you want CloudFront to automatically compress content for web requests that include Accept-Encoding: gzip in the request header."
  type        = bool
  default     = false
}

variable "default_ttl" {
  description = "Default amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request in the absence of an `Cache-Control max-age` or `Expires` header."
  type        = number
  default     = 86400
}

variable "max_ttl" {
  description = "Maximum amount of time (in seconds) that an object is in a CloudFront cache before CloudFront forwards another request to your origin to determine whether the object has been updated."
  type        = number
  default     = 31536000
}

variable "min_ttl" {
  description = "Minimum amount of time that you want objects to stay in CloudFront caches before CloudFront queries your origin to see whether the object has been updated."
  type        = number
  default     = 0
}

variable "origin_request_policy_id" {
  description = "Unique identifier of the origin request policy that is attached to the cache behavior."
  type        = string
  default     = null
}

variable "response_headers_policy_id" {
  description = " Identifier for a response headers policy."
  type        = string
  default     = null
}

variable "smooth_streaming" {
  description = "Indicates whether you want to distribute media files in the Microsoft Smooth Streaming format using the origin that is associated with this cache behavior."
  type        = bool
  default     = false
}

variable "target_origin_id" {
  description = "Value of ID for the origin that you want CloudFront to route requests to when a request matches the path pattern either for a cache behavior or for the default cache behavior."
  type        = string
}

variable "trusted_key_groups" {
  description = "List of key group IDs that CloudFront can use to validate signed URLs or signed cookies."
  type        = list(string)
  default     = []
}

variable "trusted_signers" {
  description = "List of AWS account IDs (or self) that you want to allow to create signed URLs for private content."
  type        = list(string)
  default     = []
}

variable "viewer_protocol_policy" {
  description = "Use this element to specify the protocol that users can use to access the files in the origin specified by TargetOriginId when a request matches the path pattern in PathPattern."
  type        = string
  default     = "redirect-to-https"
}

/* Forwarded Values Arguments */

variable "forwarded_values" {
  description = "Dynamic block for configuring forwarded values."
  type        = list(any)
  default     = []
}

/* Ordered Cache Behavior Arguments */

variable "ordered_cache_behavior" {
  description = "Dynamic block for configuring ordered cache behavior."
  type        = list(any)
  default     = []
}

/* Origin Arguments */

variable "origin" {
  description = "Dynamic block for configuring origin."
  type        = list(any)
  default     = []
}

/* Restrictions Arguments */

variable "locations" {
  description = " ISO 3166-1-alpha-2 codes for which you want CloudFront either to distribute your content (whitelist) or not distribute your content (blacklist)."
  type        = list(string)
  default     = []
}

variable "restriction_type" {
  description = "Method that you want to use to restrict distribution of your content by country."
  type        = string
  default     = "none"
}

/* Viewer Certificate Arguments */

variable "acm_certificate_arn" {
  description = "ARN of the AWS Certificate Manager certificate that you wish to use with this distribution."
  type        = string
  default     = null
}

variable "cloudfront_default_certificate" {
  description = "`true` if you want viewers to use HTTPS to request your objects and you're using the CloudFront domain name for your distribution."
  type        = bool
  default     = false
}

variable "minimum_protocol_version" {
  description = "Minimum version of the SSL protocol that you want CloudFront to use for HTTPS connections."
  type        = string
  default     = null
}

variable "ssl_support_method" {
  description = "How you want CloudFront to serve HTTPS requests."
  type        = string
  default     = null
}
