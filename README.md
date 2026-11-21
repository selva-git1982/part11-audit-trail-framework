# Part 11 Cloud-Native Audit Trail Framework

A practical, vendor-neutral reference architecture for building inspection-ready audit trails in regulated research platforms.

**Flow:**  
Database / application audit events → capture (CloudTrail or equivalent) → durable streaming → immutable S3 storage (Object Lock) → queryable analytics (Athena)

This repository provides:
- Architecture overview
- Operational & validation checklist
- Example Terraform modules
- Athena table definitions and sample queries

**Status:** Reference implementation to accompany the forthcoming article  
*“A Practical Cloud-Native Audit Trail Architecture for 21 CFR Part 11 Compliance in Regulated Research Platforms”*

## Quick Start

1. Review `architecture.md` and `checklist.md`
2. Adapt the Terraform examples under `terraform/` to your account and requirements
3. Use the Athena SQL under `athena/` once data is landing in S3

## Important Notes

- This is a generalized pattern only. No proprietary or confidential details are included.
- You remain responsible for validation, procedural controls, and mapping to your specific regulatory requirements.
- Test thoroughly in a non-production environment.

## License

MIT
