#!/usr/bin/env bash
set -euo pipefail


# Assumes AWS credentials are configured in env or default profile
cd terraform
terraform init -input=false
terraform apply -auto-approve


# print ALB DNS
echo "\n--- OUTPUTS ---"
terraform output -json
