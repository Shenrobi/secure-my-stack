# Project: Secure My Stack

## 🔐 Overview
This project demonstrates a complete DevSecOps pipeline integrating security checks for Infrastructure as Code (Terraform), application code (Python), and secret exposure detection. It's built for security engineers looking to automate compliance and security gates in CI/CD workflows.

## 📦 Stack Includes:
- **Terraform**: AWS VPC, Subnet, EC2, S3 with encryption
- **Python App**: Basic scanner script with intentional flaws
- **GitHub Actions**: CI/CD automation pipeline
- **Security Tools**:
  - `tfsec` + `checkov` for IaC scanning
  - `bandit` for Python static analysis
  - `gitleaks` for secrets detection

## 🚀 How to Use
1. Clone the repo and switch to a feature branch.
2. Add or modify Terraform or Python files.
3. Open a PR to `develop`. CI/CD will trigger:
   - Terraform validate + format
   - IaC scans (tfsec/checkov)
   - Bandit scan on Python app
   - Gitleaks scan for secrets
4. Merge only if all security gates pass ✅
