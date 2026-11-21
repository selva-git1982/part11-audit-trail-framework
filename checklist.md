# Operational & Validation Checklist

Use this checklist when implementing or reviewing the audit trail framework.

## Storage & Immutability
- [ ] S3 bucket has Object Lock enabled (Compliance mode recommended)
- [ ] Default retention period is set and matches policy
- [ ] Versioning is enabled
- [ ] Bucket policy denies delete/overwrite for the retention period
- [ ] Lifecycle rules are configured (if applicable) without violating retention

## Capture & Streaming
- [ ] All required audit sources are configured to forward events
- [ ] Streaming path has retry and dead-letter handling
- [ ] Monitoring/alerts exist for failed or delayed deliveries
- [ ] Clock synchronization / trusted timestamps are in place

## Queryability
- [ ] Athena database and tables are created
- [ ] Partitioning strategy (e.g., by date) is implemented
- [ ] Sample inspection queries are tested and documented
- [ ] Query results are access-controlled

## Access & Security
- [ ] Pipeline role has least-privilege write access
- [ ] Quality / audit roles have read-only access
- [ ] No broad human write access to the immutable bucket
- [ ] Encryption at rest and in transit is enabled

## Validation Considerations
- [ ] Evidence of Object Lock configuration is retained
- [ ] Periodic check that events are arriving and queryable
- [ ] Procedure exists for responding to inspection requests
- [ ] Change control covers modifications to the pipeline

## Notes
Document any deviations and their rationale. This checklist supports, but does not replace, formal system validation.
