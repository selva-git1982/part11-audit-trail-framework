# Architecture Overview

## Reference Pattern

```
Source Systems
   │
   ▼
Database / Application Audit Logs
   │
   ▼
Capture Layer (CloudTrail or equivalent)
   │
   ▼
Durable Streaming (e.g., Kinesis Data Firehose)
   │
   ▼
Immutable Storage
S3 bucket with Object Lock (Compliance mode) + versioning
   │
   ▼
Queryable Evidence
Athena tables / views
```

## Component Responsibilities

| Layer              | Purpose                              | Key Controls                          |
|--------------------|--------------------------------------|---------------------------------------|
| Capture            | Ensure events are recorded           | Completeness, reliable delivery       |
| Streaming          | Move events without loss             | Retry, dead-letter queue, monitoring  |
| Immutable Storage  | Protect against alteration           | Object Lock, retention, versioning    |
| Query Layer        | Enable fast inspection responses     | Partitioning, access control, views   |

## Design Principles

- Separate capture, protection, and queryability
- Prefer immutable storage over application-level locking
- Make common inspection questions answerable in minutes
- Limit write access to the pipeline; restrict read access to authorized roles
