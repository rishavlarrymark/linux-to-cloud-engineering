Day 7 — Terraform State

Terraform state stores mapping between:
- Terraform code
- Real infrastructure

State file is created only when:
- terraform apply is executed

Types of state:
- Local state  → stored on local machine
- Remote state → stored in shared backend (S3)

For learning:
- Understanding state is enough
- Creating state is not mandatory
