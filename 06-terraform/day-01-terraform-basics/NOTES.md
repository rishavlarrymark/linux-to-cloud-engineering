Day 1 — Terraform & IaC Basics

Terraform is an Infrastructure as Code (IaC) tool.
IaC means infrastructure is defined using code instead of manual console work.

Terraform works in a declarative way:
- You declare the desired state
- Terraform figures out how to reach it

Terraform workflow:
- terraform init    → initialize project
- terraform plan    → preview changes
- terraform apply   → create/update infra
- terraform destroy → delete infra

Without apply:
- No infrastructure is created
- No state file is generated
