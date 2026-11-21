# Example: S3 bucket with Object Lock for audit trail

resource "aws_s3_bucket" "audit_trail" {
  bucket = "example-part11-audit-trail"

  object_lock_enabled = true
}

resource "aws_s3_bucket_versioning" "audit_trail" {
  bucket = aws_s3_bucket.audit_trail.id
  versioning_configuration {
    status = "Enabled"
  }
}

resource "aws_s3_bucket_object_lock_configuration" "audit_trail" {
  bucket = aws_s3_bucket.audit_trail.id

  rule {
    default_retention {
      mode = "COMPLIANCE"
      days = 2555  # Example: ~7 years — adjust to your policy
    }
  }
}

# Additional recommended settings (encryption, public access block, etc.)
# should be added according to your security standards.
