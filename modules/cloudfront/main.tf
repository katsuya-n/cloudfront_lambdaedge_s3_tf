resource "aws_cloudfront_distribution" "s3_distribution" {
  comment = "knakano static test distribution"

  enabled = true

  default_cache_behavior {
    allowed_methods        = ["GET", "HEAD"]
    cached_methods         = ["GET", "HEAD"]
    target_origin_id       = var.s3_origin_id
    viewer_protocol_policy = "https-only"
    min_ttl                = 0
    default_ttl            = 0
    max_ttl                = 0

    lambda_function_association {
      event_type   = "viewer-request"
      lambda_arn   = var.lambda_edge_qualified_arn
      include_body = false
    }

    forwarded_values {
      query_string = false
      cookies {
        forward = "none"
      }
    }
  }

  origin {
    domain_name              = var.s3_domain_name
    origin_id                = var.s3_origin_id
    origin_access_control_id = aws_cloudfront_origin_access_control.oac.id
  }

  restrictions {
    geo_restriction {
      restriction_type = "none"
      locations        = []
    }
  }

  viewer_certificate {
    cloudfront_default_certificate = true
  }
}

resource "aws_cloudfront_origin_access_control" "oac" {
  name                              = var.cloudfront_oac_name
  description                       = "knakano static OAC Policy"
  origin_access_control_origin_type = "s3"
  signing_behavior                  = "always"
  signing_protocol                  = "sigv4"
}