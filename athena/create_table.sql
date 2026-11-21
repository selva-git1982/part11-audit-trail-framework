-- Example Athena table for audit events stored in S3
-- Adjust location, columns, and partitioning to match your actual event schema

CREATE EXTERNAL TABLE IF NOT EXISTS audit_events (
  event_time        string,
  user_identity     string,
  action            string,
  resource_id       string,
  source_system     string,
  details           string
)
PARTITIONED BY (
  year string,
  month string,
  day string
)
STORED AS PARQUET
LOCATION 's3://example-part11-audit-trail/events/'
TBLPROPERTIES ('parquet.compression'='SNAPPY');

-- After data lands, run MSCK REPAIR TABLE or add partitions explicitly
-- MSCK REPAIR TABLE audit_events;
